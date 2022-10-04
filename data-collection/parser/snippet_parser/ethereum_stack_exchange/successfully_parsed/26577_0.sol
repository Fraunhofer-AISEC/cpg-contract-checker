pragma solidity ^0.4.2;

contract DataProvider {

struct Proposal {
    address owner;
    uint id;
    bytes16 name;
    bytes32 desc;
    uint pool_size;
    address[] consents;
    bool initialized;
}

address public admin;
Proposal[] public proposals;

function DataProvider() {
    admin = msg.sender;
}

function createProposal(bytes16 nm, bytes32 ds, uint n) {
    address[] memory cons;
    proposals.push(Proposal({ owner: msg.sender, id: proposals.length, name: nm, desc: ds, consents: cons, pool_size: n, initialized: true }));
}


}
