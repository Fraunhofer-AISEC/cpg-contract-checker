pragma solidity ^0.4.24;

contract test{

    mapping(address => bool) public buyers;

    function doBuy() public payable {
       buyTokens();
    }

    function buyTokens() private returns(address){
      require(msg.value == 1 ether);
      buyers[msg.sender] = true;
    }
}
