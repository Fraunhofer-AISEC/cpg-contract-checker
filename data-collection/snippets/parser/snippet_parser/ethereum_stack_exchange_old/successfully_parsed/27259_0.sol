pragma solidity ^0.4.17;

library SharedStructs {
    struct Thing {
        address[] people;
    }    
}

contract A {
    SharedStructs.Thing thing;
}

contract B {
    SharedStructs.Thing thing;
}
