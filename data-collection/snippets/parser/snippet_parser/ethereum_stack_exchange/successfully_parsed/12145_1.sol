pragma solidity ^0.5.7;


contract MappingLoop {

constructor() public {
    structs[0][0].addr = msg.sender;
    structs[0][0].amount = 10;
    structs[0][1].addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    structs[0][1].amount = 20;
    totalStructs[0] = 1; 
}


struct Struct {
    address addr;
    uint256 amount;
}
mapping (uint256 => mapping (uint256 => Struct)) internal structs;
mapping (uint256 => uint256) public totalStructs;


function simpleLoopFor (uint256 id) public returns(uint256) {
    require (totalStructs[id] > 0);
    uint256 totalAmount;
    for(uint8 i=0; i<= totalStructs[id]; i++){
        address addr   = structs[id][i].addr;
        uint256 amount = structs[id][i].amount;
        log0(bytes32(uint256(addr)));
        totalAmount = totalAmount + amount;
    }
    return totalAmount;
}
}
