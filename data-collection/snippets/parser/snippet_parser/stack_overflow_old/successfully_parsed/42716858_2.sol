
pragma solidity ^0.8.1;

contract HelloWorld {
    string[] strings;

    
    function pushToStrings(string memory _data) public{
        strings.push(_data);
    }
    
    
    function GetAllStrings() view public returns(string[] memory){
        return strings;
    }

    
    function GetNthStrings(uint x) view public returns(string memory){
        return strings[x];
    }

    
    function pushStringsArray(string[] memory someData) public{
        for (uint i=0; i < someData.length; i++) {
           strings.push(someData[i]);
        }
    }
    
    
    function changeWholeString(string[] memory someData) public{
       strings=someData;

    }
}
