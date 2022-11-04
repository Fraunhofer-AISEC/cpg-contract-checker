pragma solidity ^0.4.24;

contract Autos {

address public owner;
mapping(address => bool) members;


modifier onlyMember {
    require(msg.sender == owner || members[msg.sender] == true);
    _;
    }


}
