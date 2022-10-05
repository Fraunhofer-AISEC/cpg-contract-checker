
pragma solidity 0.5.12;

contract Dflip{

    uint contractBalance;
    address public owner;

    constructor() public {
      owner = msg.sender;
    }

    modifier costs (uint cost){
        require(msg.value >= cost,"The minimum value to place bet is 0.01 ether");
        _;
    }

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    event flipCoinData(uint betValue,bool result);
    event withdrawFundData(uint amount);
    event fundContractData(address funder,uint fundAmount);

function flipCoin() public payable costs(0.1 ether) returns(bool)  {
    require(msg.value <= contractBalance,"The contract doesn't have enough balance");
  bool result;
  uint chance;
  chance = now % 2;
  if (chance == 0){
      contractBalance += msg.value;
    result = false;
  }
  else if ( chance == 1){
      contractBalance -= msg.value;
      msg.sender.transfer(msg.value*2);
    result = true;
  }
  return result;
  emit flipCoinData(msg.value,result);
}

function getContractBalance() public view returns(uint){
    return address(this).balance;
}
function withdrawAll() public onlyOwner {
    emit withdrawFundData(contractBalance);
    msg.sender.transfer(contractBalance);

}
function fundContract() public payable {
    require(msg.value != 0);
    contractBalance += msg.value;
    emit fundContractData(msg.sender,msg.value);
}
}
