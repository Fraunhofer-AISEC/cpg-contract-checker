
pragma solidity 0.8.7;

contract HelloWorld{

    string public message;

    constructor(string memory _message){
        message = _message;
    }


    function hello() public view returns(string memory){
        return message; 
    }

    function setMessage(string memory _message) public{
        message = _message;
    }

}
