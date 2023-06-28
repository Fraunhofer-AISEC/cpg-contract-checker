pragma solidity >=0.4.21 <0.6.0;

contract SubContract {
    uint public foo;

    constructor() public {
        foo = 0;
    }
}

contract MainContract {
    SubContract public my_contract;

    constructor() public {
        my_contract = new SubContract();
    }
}
