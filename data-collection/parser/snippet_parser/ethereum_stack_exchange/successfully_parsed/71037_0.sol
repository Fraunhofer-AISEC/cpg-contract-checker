pragma solidity ^0.5.0;

contract A {

    address _sub = address(B);

    function write(uint256 _a) public returns (bool, bytes memory) {
        (bool x, bytes memory y) = _sub.call(msg.data);
        return (x, y);
    }

    function read(uint256 _b) public view returns (bool, bytes memory) {
        (bool x, bytes memory y) = _sub.staticcall(msg.data);
        return (x, y);
    }
}
