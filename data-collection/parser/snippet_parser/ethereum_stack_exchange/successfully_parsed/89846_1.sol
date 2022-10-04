pragma solidity ^0.7.0;

contract PCE_Contract {

  uint256 public LOCK_PERIOD  = 365 days;
  address public investor;

  mapping(address => Deposit) deposits;

  constructor(){
  
  investor = msg.sender;
  }

  struct Deposit {
      uint256 value;
      uint256 releaseTime;
  }

  function investment() public payable {
       require(msg.value > 0,
         "You must make a non-zero deposit.");

       if (deposits[investor].releaseTime == 0) {
           uint256 releaseTime = block.timestamp + LOCK_PERIOD;
           deposits[investor] = Deposit(msg.value, releaseTime);

       } else {
           deposits[investor].value += msg.value;
       }
   }

   function withdraw() public {

    require(deposits[investor].value > 0,
      "You have no deposits available.");

    require(deposits[msg.sender].releaseTime < block.timestamp,
      "Your lock period has not ended yet.");

    msg.sender.transfer(deposits[investor].value);

    deposits[msg.sender].value = 0;
    deposits[msg.sender].releaseTime = 0;
}

function getDeposit(address holder) public view
  returns (uint256 value, uint256 releaseTime)

  {
        return(deposits[holder].value, deposits[holder].releaseTime);
    }

}

