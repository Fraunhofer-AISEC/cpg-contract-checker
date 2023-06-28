
pragma solidity ^0.8.4;

contract Counter {
    uint256 public count;

    address public Owner;

    event Increment(uint256 value);
    event Decrement(uint256 value);

    constructor() public {
        count = 0;
    }

    function getCount() public view returns (uint256 count) {
        return count;
    }

    function increment() public payable {
        require(msg.value > 10);
        count += 1;
        emit Increment(count);
    }

    function decrement() public payable {
        require(msg.value > 100);
        count -= 1;
        emit Decrement(count);
    }
}
