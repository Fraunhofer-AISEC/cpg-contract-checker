modifier testMod {
    ++stateVar1;
    _;
    ++stateVar2;
}

function testFunc() public testmod {
    --stateVar3;
}
