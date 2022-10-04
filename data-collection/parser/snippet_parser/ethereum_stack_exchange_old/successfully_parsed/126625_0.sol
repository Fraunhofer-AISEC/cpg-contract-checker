
pragma solidity ^0.8.0;

contract Profile {
    
    mapping(address => string[3]) public address_name_imgHash_bio;

function updateName(string memory _name) external {
    address_name_imgHash_bio[msg.sender][0] = _name;
}

function updateImg(string calldata _imgHash) external {
    address_name_imgHash_bio[msg.sender][1] = _imgHash;
}

function updateBio(string calldata _bio) external {
    address_name_imgHash_bio[msg.sender][2] = _bio;
}


function getter(uint index) external view returns(string memory) {
    return address_name_imgHash_bio[msg.sender][index];
}
}
