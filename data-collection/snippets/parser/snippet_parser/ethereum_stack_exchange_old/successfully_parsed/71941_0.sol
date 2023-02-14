pragma solidity ^0.5.0;

    contract testCompile{
        string myString = "Hello World";

        function showString() public view returns (string memory){
            return myString;
        }        
    }
