contract A {
    string[] order;

    constructor(uint _x) {
        log("constructor of A");
    }

    function log(string memory _word) internal returns (uint) {
        order.push(_word);
        return 42;
    }
}

contract B is A {
    uint b = log("declaration of b");

    constructor(uint _x) A(log("args of A")) {
        log("constructor of B");
    }
}

contract C is B {
    uint c = log("declaration of c");

    constructor() B(log("args of B")) {
        log("constructor of C");
    }

    function get() public view returns (string[] memory) {
        return order;
    }
}
