# Solidity source code
contract_source_code = '''
pragma solidity ^0.4.1;

contract Identities {

event existProduction(bool);
address private owner;
mapping(address => bool) private production;

function Identities() public {
    owner = msg.sender;
}

function setProduction(address id, bool include) public {
    require(msg.sender == owner);
    production[id] = include;
}

function proofProduction(address id) public constant returns (bool) {
    existProduction(production[id]);
    return production[id];
}
