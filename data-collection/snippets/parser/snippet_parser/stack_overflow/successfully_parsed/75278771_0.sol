pragma solidity 0.8.17;

contract Contract1 {
    constructor() {
        new Contract2(address(this));
    }

    function foo() public pure returns (string memory) {
        return "bar";
    }
}

contract Contract2 {
    Contract1 contract1;

    constructor(address _contract1) {
        contract1 = Contract1(_contract1);
        contract1.foo();
    }
}
