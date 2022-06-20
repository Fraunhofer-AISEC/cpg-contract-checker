pragma solidity ^0.4.8;

contract Owned{

    address public owner = msg.sender;


    modifier onlyOwner(){
        assert(msg.sender == owner);
        _;
    }

    function kill() onlyOwner{
        require(msg.sender ==owner);
        suicide(owner);
    }
}
