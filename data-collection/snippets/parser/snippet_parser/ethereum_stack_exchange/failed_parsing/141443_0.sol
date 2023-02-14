
pragma solidity ^0.8.0;


import "./SafeMath.sol";


import "./ERC165.sol";


import "./Ownable.sol";

contract Lottery is Ownable, ERC165 {
 
  uint256 public ticketPrice;
  
  uint256 public requiredParticipants;

 
  address payable public winner;

 
  address[] public participants;
  
  uint256 public numParticipants;

 
  constructor(uint256 _ticketPrice, uint256 _requiredParticipants) public {
   
    ticketPrice = _ticketPrice;
    requiredParticipants = _requiredParticipants;
  }

 
  function join() public payable {
   
    require(msg.value == ticketPrice, "Invalid payment amount");

    participants.push(msg.sender);

    numParticipants++;

    assert(numParticipants == participants.length);

  }

  function drawWinner() public {
    bool found = false;

    for (uint256 i = 0; i < participants.length; i++) {

     if (participants[i] == msg.sender) {

       found = true;

       break;

     }

    }

    require(found, "Only participants can draw a winner");

    require(numParticipants >= requiredParticipants, "Not enough participants");

    uint256 randomNumber = block.difficulty;

    winner = address payable(participants[randomNumber % requiredParticipants]);

  }



  function claimReward() public {

    require(msg.sender == winner, "Only the winner can claim the reward");

    winner.transfer(address(this).balance);

    winner = address(0);

    delete participants;

    numParticipants = 0;

  }

  
  function cancel() public onlyOwner {

    for (uint256 i = 0; i < participants.length; i++) {

      participants[i].transfer(ticketPrice);

    }

    winner = address(0);

    for (uint256 i = 0; i < participants.length; i++) {

      delete participants[i];

    }

    numParticipants = 0;

  }

}
