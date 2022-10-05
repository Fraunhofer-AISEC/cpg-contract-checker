pragma solidity ^0.4.17;

contract Inbox {
    string public message;
    string[] hex_storage;
    address owner;

     event printHex(string x);

    function Inbox(string initialMessage) public payable {
        owner = msg.sender;
        message = initialMessage;
    }

    modifier isOwner {
        require(msg.sender == owner);
        _;
    }

    function setMessage(string newMessage) public 
    {
        message = newMessage;
    }
        function getMessage() public view returns (string) 
        {
            return message;
        }

    function storeMember(string hex_data) public 
    {
        hex_storage.push(hex_data);
    }

    function showMember() public 
    {
        for (uint i=0; i<hex_storage.length; i++)
        {
            printHex(hex_storage[i]);
        }
    }

    function cleanOutBalance() isOwner public  
    {
        uint bal = address(this).balance;
        address(owner).transfer(bal);
    }

    function displayBalance() public view returns (uint)
    {
        uint bal = address(this).balance;
        return bal;
    }


}
