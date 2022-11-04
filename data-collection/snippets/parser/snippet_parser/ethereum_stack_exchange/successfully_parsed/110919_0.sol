contract Counter {
    uint256 public count;

    address public Owner;

    event Increment(uint256 value);
    event Decrement(uint256 value);

    constructor() public {
        count = 0;
    }

    function increment() public {
        count += 1;
        emit Increment(count);
    }

    function decrement() public {
        count -= 1;
        emit Decrement(count);
    }
}
