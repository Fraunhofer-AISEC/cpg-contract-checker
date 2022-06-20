pragma solidity >=0.5.0 <0.7.0;

contract Counter {
    uint public _counter = 0;

    function GenNextID() public returns (uint) {
        return _counter++;
    }
}
