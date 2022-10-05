pragma solidity ^0.4.16;

contract init {
        address owner;
        function init()
        {
            owner = msg.sender;
        }

        function send() public payable{
            owner.transfer(msg.value);

        }  
}
