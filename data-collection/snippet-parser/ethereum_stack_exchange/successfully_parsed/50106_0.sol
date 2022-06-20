pragma solidity ^0.4.23;

contract Lottery is usingOraclize {

  uint lotteryFee = 0.1 ether;
  uint8 counter = 0;
  address[10] participants;
  mapping (address => bool) checkParticipant;
  address public owner;
  bytes32 public oraclizeID;
  uint public winnerNumber;


  modifier onlyOnce() {
      require(checkParticipant[msg.sender] == false);
      _;
  }


  function participate() external payable onlyOnce returns(address) {
    require(msg.value == lotteryFee);
    checkParticipant[msg.sender] = true;
    counter = counter + 1;  
    participants[counter] = msg.sender;
    return(participants[counter]);
  }

  function getBalance() public view returns (uint) { 
    uint contractBalance = address(this).balance;
    return(contractBalance);
  }

  function selectWinner() payable public {
    oraclizeID = oraclize_query("WolframAlpha", "random number between 1 and 10");
  }

  function __callback(bytes32 _oraclizeID, string _result){
    if(msg.sender != oraclize_cbAddress()) throw;
    testString = _result;
    winnerNumber = parseInt(_result);
    uint maxRange = counter; 
    uint randomNumber = uint(sha3(_result)) % maxRange; 
  } 

  function payTheReward() external returns(address){
    address winnerAddress = participants[winnerNumber]; 
    uint currentBalance = getBalance();
    winnerAddress.transfer(currentBalance);
    deleteParticipants();
    return (winnerAddress);
  }

  function deleteParticipants() internal {
    uint8 a = counter;
    for(uint8 i = 0; i < a; i++) {
      checkParticipant[participants[i]] = false;
      participants[i] = 0;
    }
    counter = 0;
  }
}
