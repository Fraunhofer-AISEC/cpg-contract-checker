

pragma solidity >=0.7.0 <0.9.0;          

contract Messenger{
    mapping(address=>string[])public message;      
    function sendMessage(address _address,string memory _msg) public{   
   message[_address].push(_msg);  
    }  
    function readMessage(address _add)public view returns(string memory){  
        return message[_add];  
    }  
}  
