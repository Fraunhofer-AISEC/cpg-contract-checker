pragma solidity ˆ0.4.0;
uint storedData;
function set(uint x) public {
    storedData = x;
}
function get() contsant public returns (uint) {
    return storedData;
}
funtion increment (uint n) public {
    storedData = storedData + n;
}
funtion decrement (uint n) public {
    storedData = storedData - n;
}
