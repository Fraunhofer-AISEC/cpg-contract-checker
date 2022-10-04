pragma solidity >=0.4.21 <0.6.0;

contract Sampleapp {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}
