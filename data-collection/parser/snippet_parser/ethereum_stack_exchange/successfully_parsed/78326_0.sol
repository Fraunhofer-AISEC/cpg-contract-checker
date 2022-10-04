pragma solidity ^0.5.0;

contract SampleContract{
    string public str;
    constructor()public{
        str="Hello World!"; 
    }
    function setter(string memory s)public{
        str=s;  
    }
}
