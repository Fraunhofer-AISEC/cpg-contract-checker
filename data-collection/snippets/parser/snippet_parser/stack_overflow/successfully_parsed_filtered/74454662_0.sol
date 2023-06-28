contract BeforeDemo {
    uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** 18);

    constructor() {
        check(INITIAL_SUPPLY);
    }

    function check(uint256 supply) public {

    }

}


contract AfterDemo {

    constructor() {
        check(10000 * (10 ** 18));
    }

    function check(uint256 supply) public {

    }

}
