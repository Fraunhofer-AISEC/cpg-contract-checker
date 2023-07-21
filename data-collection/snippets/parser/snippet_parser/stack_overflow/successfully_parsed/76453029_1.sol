
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract NFTTicketSaleContract is VRFConsumerBase, IERC721Receiver {
    
    uint256 public startTime;
    uint256 public endTime;
    uint256 public priceOfTicket;
    address public winner;

    
    event NFTDeposit(address indexed deployer, address indexed nftAddress);

    
    event TicketPurchase(address indexed participant, uint256 ticketAmount);

    
    event WinnerSelected(address indexed winner);

    
    bytes32 internal keyHash;
    uint256 internal fee;
    uint256 public randomResult;
    address public deployer;

    
    mapping(address => uint256) public ticketPurchases;

    
    address[] private participants;

    
    constructor(
        address _vrfCoordinator,
        address _linkToken,
        bytes32 _keyHash,
        uint256 _fee,
        uint256 _startTime,
        uint256 _endTime,
        uint256 _priceOfTicket
    ) VRFConsumerBase(_vrfCoordinator, _linkToken) {
        keyHash = _keyHash;
        fee = _fee;
        startTime = _startTime;
        endTime = _endTime;
        priceOfTicket = _priceOfTicket;
        deployer = msg.sender;
    }

    
    function depositNFT(address _nftAddress, uint256 _nftId) external {
        
        require(_nftAddress != address(0), "Invalid NFT address");

        
        IERC721 nftContract = IERC721(_nftAddress);
        require(nftContract.ownerOf(_nftId) == msg.sender, "You are not the owner of the NFT");

        
        nftContract.approve(address(this), _nftId);

        
        nftContract.transferFrom(msg.sender, address(this), _nftId);

        emit NFTDeposit(msg.sender, _nftAddress);
    }

    
    function _checkERC721Support(address _nftAddress, address _recipient) internal returns (bool) {
        (bool success, bytes memory returnData) = _nftAddress.call(
            abi.encodeWithSelector(0x150b7a02, _recipient, uint256(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))
        );
        return success && (returnData.length > 0);
    }

    
    function purchaseTicket(uint256 _ticketAmount) external payable {
        require(block.timestamp >= startTime && block.timestamp <= endTime, "Ticket sale is not active");
        require(msg.value == _ticketAmount * priceOfTicket, "Incorrect ticket payment amount");

        
        ticketPurchases[msg.sender] += _ticketAmount;
        if (ticketPurchases[msg.sender] == _ticketAmount) {
            participants.push(msg.sender);
        }

        emit TicketPurchase(msg.sender, _ticketAmount);
    }

    
    function selectWinner() external returns (bytes32 requestId) {
        require(msg.sender == deployer, "Only the deployer can select the winner");
        require(block.timestamp > endTime, "Ticket sale is still active");
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK tokens in the contract");
        require(participants.length > 0, "No participants in the ticket sale");

        
        return requestRandomness(keyHash, fee);
    }

    
    function fulfillRandomness(bytes32 _requestId, uint256 _randomness) internal override {
        randomResult = _randomness;

        
        uint256 ticketCount = getTotalTicketCount();
        uint256 randomIndex = randomResult % ticketCount;
        winner = participants[randomIndex];

        emit WinnerSelected(winner);
    }

    
    function getTotalTicketCount() public view returns (uint256) {
        uint256 totalCount = 0;
        for (uint256 i = 0; i < participants.length; i++) {
            totalCount += ticketPurchases[participants[i]];
        }
        return totalCount;
    }

    
    function getAllParticipantAddresses() public view returns (address[] memory) {
        return participants;
    }

    
    function onERC721Received(
        address,
        address,
        uint256,
        bytes calldata
    ) external override returns (bytes4) {
        return this.onERC721Received.selector;
    }
}
