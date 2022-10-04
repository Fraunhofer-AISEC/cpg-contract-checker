contract Fruit {
    address thing = address(12345);
}

contract Apple is Fruit {
    function eat() external {
        thing.call("");
    }
}

contract Banana is Fruit {
    function eat() external {
        thing.call("");
    }
}
