pragma solidity ^0.4.2;

contract Maker {
uint x;

function Maker() {
    x = 5;
    Taker take = new Taker(this, 2);
    bool a = take.call.gas(200000).value(10)();
}

function change(uint val) external payable {
    x = val;
}
}

contract Taker {
uint y;
address maker;

function Taker(address makerAddr, uint val) {
    y = val;
    maker = makerAddr;
}

function sendChange() {
    maker.change.value(5)(y);
}
}
