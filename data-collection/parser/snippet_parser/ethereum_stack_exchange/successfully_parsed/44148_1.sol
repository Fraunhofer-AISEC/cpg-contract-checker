pragma solidity ^0.4.17;

contract Token{
    address public owner;

    function transferOwnerShip(address _newOwner) public {
        require (msg.sender == owner);
        owner = _newOwner;
    }

    function Token() public{
        owner = msg.sender;
    }
}


contract Crowdsale{
    Token tokenContract;
    address crowdsaleOwner;

    function Crowdsale(address _tokenAddress) public {
      tokenContract = Token(_tokenAddress);
      crowdsaleOwner = msg.sender;
    }


    function transferOwnerShipBack(address _newOwner) public {
        require(msg.sender == crowdsaleOwner);
        tokenContract.transferOwnerShip(_newOwner);
    }
}
