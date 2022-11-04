
pragma solidity 0.8.13;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract AmpToken is ERC1155, ERC2981, ReentrancyGuard {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    Counters.Counter private _itemsSold;

    enum PaymentStatus{PENDINGPAYMENT, SENT}

    
    event AmpCreated(
        uint256 indexed id,
        address creator,
        address owner,
        string name,
        uint256 price,
        uint256 _amount
    );

    struct Amp {
        uint256 id;
        address payable creator;
        uint256 price;
        uint256 amount;
        string name;
        bool valid;
   }

    struct Payment{
        uint256 id;
        address learner;
        PaymentStatus _state;
        
    }

    address payable public owner;
    uint256 lillupPrice = 0.000033 ether;

    
    mapping(uint256 => Amp) public idToAmp;
    mapping(uint256 => Payment) public idToPay;
    mapping(uint256 => bool) private soldOut;
    mapping(address => bool) public creators;
    mapping(address => bool) public apprvLearner;
    mapping(address => bool) public whitelist;
    mapping (address => uint256) internal balances;

    uint256 public nextCreatorsId;
    uint256 public nextLearnerId;
    uint256 public nextPaymentId;
    uint public totalAmp;
    

    constructor() ERC1155("https://ipfs.io/ipfs/bafybeigb7tqhulo5zciqshuzvofz3pv7kozrs57fgjo53jz5n4qkl66qzu/Amp.json") {
        
        owner = payable(msg.sender);
        _setDefaultRoyalty(owner, 800);
    }

    
    function approveCreators(address _creators) onlyOwner public {
        
        
        require(creators[_creators] != true, "Already Creator");
        creators[_creators] = true;
        nextCreatorsId++;
    }

    function withdraw() external onlyOwner nonReentrant {
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Transfer failed.");
    }
    
    function BalanceOf(address _creators) public view returns (uint256 balance) {
        return balances[_creators];
    }
    
    
    
    function createAmp(
        string memory _name,
        uint256 _id,
        uint256 _price,
        uint256 _amount
    ) public payable virtual  returns (uint256) {
    
    
    
    
    
    
        _setDefaultRoyalty(owner, 800);
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();
        idToAmp[_id].creator = payable(msg.sender);
        idToAmp[_id].name = _name;
        idToAmp[_id].price = _price;
        idToAmp[_id].amount = _amount;
        idToAmp[_id].valid = true;
        
        _mint(msg.sender, _id, _amount, "");

        totalAmp += _amount;

        return newTokenId;

    
    }
    
    
    function sendAmp(
        address _to,
        uint256 _id,
        uint256 _amount
    ) public  nonReentrant {

        idToPay[_id] = Payment(
            idToPay[_id].id = nextPaymentId,
            _to,
            idToPay[_id]._state = PaymentStatus.PENDINGPAYMENT
        );
        nextPaymentId++;


        
        
        idToAmp[_id] = Amp(
            _id,
            payable(msg.sender),
            _amount,
            idToAmp[_id].price,
            idToAmp[_id].name,
            idToAmp[_id].valid
        );
        
        


        
        
        _safeTransferFrom(_msgSender(), _to, _id, _amount, "");

    }

     function sendPayment(uint _id) public payable onlyLearner {
        
        
        Payment storage payment = idToPay[_id];
        require(msg.sender == payment.learner, "Please connect the correct wallet address");
        require(idToPay[_id]._state == PaymentStatus.PENDINGPAYMENT, "Payment Not Active");   
        
    }


    
    
    
    function setLearner(address _learner) public {
        require(
           creators[_learner] != true,
            "Already a creator. This address cannot be student"
        );
        apprvLearner[_learner] = true;
        nextLearnerId++;
    }
    
    
    function setWhiteList(address _whitelist) public onlyCreators {
        whitelist[_whitelist] = true;
        
    }

    
    
    function createMarketSale(uint256 _id, uint256 _amount)
        public
        payable
        onlyLearner
    {
        address creator = idToAmp[_id].creator;
        uint256 price = idToAmp[_id].price;
        uint256 tokenId = idToAmp[_id].id;
        require(idToAmp[_id].amount >= 1, "Course Sold Out");
        require(_amount == 1, "Amount too high, Select 1 token");
        idToAmp[_id].creator = payable(address(0));
        
        if (whitelist[_msgSender()] == true) {
            _safeTransferFrom(address(this), msg.sender, tokenId, _amount, "");
            payable(creator).transfer(msg.value);
            idToAmp[_id].amount = idToAmp[_id].amount - 1;
            
        } else {
            require(msg.value == price, "Please submit the asking price");
            _safeTransferFrom(address(this), msg.sender, tokenId, _amount, "");
            payable(creator).transfer(msg.value);
            idToAmp[_id].amount = idToAmp[_id].amount - 1;
            
        }
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC1155, ERC2981)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function onERC1155Received(
        address,
        address,
        uint256,
        uint256,
        bytes memory
    ) public virtual returns (bytes4) {
        return this.onERC1155Received.selector;
    }

    function onERC1155BatchReceived(
        address,
        address,
        uint256[] memory,
        uint256[] memory,
        bytes memory
    ) public virtual returns (bytes4) {
        return this.onERC1155BatchReceived.selector;
    }

    

    
    

    modifier onlyOwner() {
        require(owner == msg.sender , "Only Owner");
        _;
    }
    modifier onlyCreators() {
        require(creators[_msgSender()] == true, "Only Creators");
        _;
    }

    modifier onlyLearner() {
        require(
            apprvLearner[_msgSender()] == true,
            "Please register as a Student"
        );
        _;
    }
}
