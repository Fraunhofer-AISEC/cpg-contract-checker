pragma solidity ^0.8.0;

contract InterfaceB {
    function getMessage() external pure returns(string memory);
}

contract ContractB {    
    function getMessage() pure external returns(string memory){
            return "Hellow World.";
    }
}
