pragma solidity ^0.5.1;

import "./Ownable.sol";

contract Entry is Ownable { 
    mapping (address => string) hash;


    function addEntry(string memory _hash) public {
        hash[msg.sender] = _hash;
    }

    function getHash() public view returns(string memory){
        return hash[msg.sender];
    }

}
