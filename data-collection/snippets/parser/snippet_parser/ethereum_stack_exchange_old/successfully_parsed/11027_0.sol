pragma solidity ^0.4.0;

contract SimpleStorage {

address owner;

function SimpleStorage() {
    owner = msg.sender;
}

modifier onlyOwner {
    if (msg.sender != owner)
        throw;
    _;
}

struct Sample {
    uint256 id;
    string data;
}

uint256 public id;
Sample[] public setData; 
function set(string data) {
    setData.push(Sample({
        id: id,
        data: data
    }));
    id++;
}
}
