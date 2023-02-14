pragma solidity ^0.5.0;
import "./SafeMath.sol";

contract SimpleStorage {
    using SafeMath for uint;
    uint x;

    event incremented(uint x);

    constructor() public{
        x=0;
    }

    function increment() public {
        x.add(1);
        emit incremented(x);
    }

    function get() external view returns (uint) {
        return x;
    }
}
