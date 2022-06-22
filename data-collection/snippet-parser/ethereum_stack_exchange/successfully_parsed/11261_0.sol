contract B {

function getGasLimit() returns (uint) {
    uint gasLimit;

    assembly {
        gasLimit := gaslimit
    }
    return gasLimit;

}

}
