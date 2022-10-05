pragma solidity ^0.8;

contract MyContract {
    string s1 = "Lorem";
    string s2 = "ipsum";
    
    function foo() external view returns (string memory) {
        return string(abi.encodePacked(s1, " ", s2));
    }
}
