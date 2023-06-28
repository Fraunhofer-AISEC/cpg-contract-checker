

pragma solidity ^0.6.0;



import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract EtherCoinFlip is VRFConsumerBase {
    uint256 minimumEth = 100000;
    uint256 etherWinnings;

    struct EtherCoinFlipStruct {
        address payable betStarter;
        uint256 startingWager;
        address payable betEnder;
        uint256 endingWager;
        uint256 etherTotal;
        address payable winner;
        address payable loser;
    }

    uint256 numCoinFlips = 300;
    mapping(uint256 => EtherCoinFlipStruct) EtherCoinFlipStructs;
    
    
    
    
    
    bytes32 private s_keyHash;
    uint256 private s_fee;
    uint256 public randomResult;
    
    constructor(address vrfCoordinator, address link, bytes32 keyHash, uint256 fee) 
        VRFConsumerBase(vrfCoordinator, link) public
    {
        s_keyHash = keyHash;
        s_fee = fee;
    }
    

    
    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomResult = randomness;
    }
    
    
    
    event EtherCoinFlipped(uint256 indexed coinFlipID, bytes32 indexed requestId);
    
    
    
    function newCoinFlip() public payable returns (uint256 coinFlipID, bytes32 requestId) {
        require(msg.value >= minimumEth);
        require(LINK.balanceOf(address(this)) >= s_fee, "Not enough LINK to pay fee");
        requestId = requestRandomness(s_keyHash, s_fee);
        coinFlipID = numCoinFlips++;
        EtherCoinFlipStructs[coinFlipID] = EtherCoinFlipStruct(
            msg.sender,
            msg.value,
            msg.sender,
            0,
            0,
            msg.sender,
            msg.sender);
        emit EtherCoinFlipped(coinFlipID, requestId);
    }
    
    
    event EtherCoinFinishedFlip(address indexed winner);
    
    
    
    
    function endCoinFlip(uint256 coinFlipID, uint256 randomness) public payable {
        
        require(coinFlipID == coinFlipID);
        EtherCoinFlipStruct memory c = EtherCoinFlipStructs[coinFlipID];
        c.betEnder = msg.sender;
        c.endingWager = msg.value;
        c.etherTotal = c.startingWager + c.endingWager;
    
        
        uint256 finalVerdict = randomness;
            
        if ((finalVerdict % 2) == 0) {
            c.winner = c.betStarter;
        } else {
            c.winner = c.betEnder;
        }

        c.winner.transfer(c.etherTotal);
        
        emit EtherCoinFinishedFlip(c.winner);
    }
}
