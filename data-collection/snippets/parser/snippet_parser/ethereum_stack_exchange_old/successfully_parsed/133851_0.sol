
pragma solidity ^0.8.4;

contract passwordContract {
bytes32 password;
address owner;

constructor(uint32 _password) {
    owner = msg.sender;
    password = keccak256(abi.encodePacked(_password,msg.sender));
}

modifier onlyOwner() {
    require(msg.sender == owner, "only owner");
    _;
}

function getPassword() external view onlyOwner returns(bytes32) {
    return password;
}



function canCallAnyOne(bytes32 _password) public {
    require(_password == password,"wrong password");
    
}
}
