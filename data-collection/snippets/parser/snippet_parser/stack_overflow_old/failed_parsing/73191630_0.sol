contract Counter {
    uint256 value = 0;

    function addOne() external {
        value += 1;
    }
}

contract MyContract {
    Counter a = .....;
    Counter b = .....;

    

    function myFunc() external {
        
        a.addOne();
        b.addOne();
    }
}
