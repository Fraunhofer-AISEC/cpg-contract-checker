contract Counter {
    uint256 public count;

    address public Owner = 0xCA413Bf88AB23371d8E16248738a0b093b5cB3F0;

    event Increment(uint256 value);

    constructor() public {
        count = 0;
    }

    function getCount() public view returns (uint256 count) {
        return count;
    }

    function increment() public payable {
        require(msg.value >= 340628155250860);
        count += 1;
        emit Increment(count);
    }
}
