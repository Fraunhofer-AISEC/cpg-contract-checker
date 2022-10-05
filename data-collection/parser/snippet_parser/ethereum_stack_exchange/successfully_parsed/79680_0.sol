pragma solidity ^0.5.0;

contract Contract1 {

  address payable owner;
  uint public value;

  constructor() public payable {
    owner = msg.sender;  
    value = msg.value;
  }

  function() external payable {

    value = msg.value;

  }


}


contract Contract2{

    Contract1 public c;

    function setContract(address payable _addr) public{

     c = Contract1(_addr);

    }

    function() external payable{



    }

    function sendEther() public payable{

        address(c).transfer(msg.value);

    }



}
