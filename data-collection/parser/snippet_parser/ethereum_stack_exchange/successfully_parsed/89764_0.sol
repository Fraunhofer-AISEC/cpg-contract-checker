pragma solidity 0.5.12;

import "github.com/provable-things/ethereum-api/provableAPI.sol";

contract CoinFlip is usingProvable{
    
    address public owner;
    uint public contractBalance;

    uint256 constant NUM_RANDOM_BYTES_REQUESTED = 1;
    uint public latestNumber;
    
    constructor() public payable{
        require(msg.value > 10 wei);
        contractBalance = msg.value;
        owner = msg.sender;
    }
    
    struct betConfig {
        address player;
        uint coinSide;
        uint bettingValue;
    }
    
    struct callbackMapping{
        uint randomNumber;
        uint side;
        address payable playerAddress;
        uint betValue;
        bool winOrLose;
    }
    
    mapping (address => betConfig) public betInfo;
    mapping (bytes32 => callbackMapping) public waiting;
    
    
    event LogNewProvableQuery(string description);
    event generatedRandomNumber(uint256 randomNumber);
    
    event mappingUpdated(string description);
    event playerInfoAdded(string description);
    
    event result(string description);
    
    
    
    function bet(uint _coinSide) public payable {
        require(msg.value > 5 wei);
        uint valueToBet = msg.value;
        
        uint256 QUERY_EXECUTION_DELAY = 0;
        uint256 GAS_FOR_CALLBACK = 200000;
        
        bytes32 queryId = provable_newRandomDSQuery(
            QUERY_EXECUTION_DELAY,
            NUM_RANDOM_BYTES_REQUESTED,
            GAS_FOR_CALLBACK
            );
            emit LogNewProvableQuery("Provable query was sent, standing by for the answer");
        
        waiting[queryId].playerAddress = msg.sender;
        waiting[queryId].side = _coinSide;
        waiting[queryId].betValue = valueToBet;
        
            emit mappingUpdated("Mapping updated. Waiting for random number.");
    }
    
    function __callback(bytes32 _queryId, string memory _result, bytes memory _proof) public {
        require(msg.sender == provable_cbAddress());

        uint256 randomNumber = uint256(keccak256(abi.encodePacked(_result))) % 2;
        latestNumber = randomNumber;
        
        emit generatedRandomNumber(randomNumber);
        
        processResults(_queryId, latestNumber);
    }
    
    function processResults(bytes32 id, uint number) private {
        waiting[id].randomNumber = number;
        
        if (waiting[id].randomNumber == 1){
            waiting[id].winOrLose == true;
                uint prize =  waiting[id].betValue * 3;
                waiting[id].playerAddress.transfer(prize);
                
                emit result("You won!");
        }
        if (waiting[id].randomNumber == 0){
            waiting[id].winOrLose == false;
            
                emit result("You lost.");
        }
    }
}
