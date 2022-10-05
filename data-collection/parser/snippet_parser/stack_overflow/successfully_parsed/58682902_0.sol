pragma solidity ^0.5.0;

contract Test{
    
    string private str;
    
    constructor() public {
        str = " ";
    }
    
    function getStr() public view returns(string memory  _str){
        _str = str;
    }
    
    function setStr(string memory  _str) public{
        str = _str;
    }
}
