pragma solidity ^0.4.15;


contract Ownable {

    address public owner;

    
    function Ownable() internal {
        owner = msg.sender;
    }

    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

}

contract Secret is Ownable {

  string private secret;

  function Secret() public {
    secret = "";
  }

  function setSecret(string _secret) public onlyOwner {
    secret = _secret;
  }

}
