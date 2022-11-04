pragma solidity ^0.4.21;

contract Test{
    address admin;

    function Test() public{
        admin = msg.sender;
    }

    string str = "";

    function setStr(string _str) public{
        str = _str;
    }

    function getStr() public view returns (string){
        return str;
    }
}
