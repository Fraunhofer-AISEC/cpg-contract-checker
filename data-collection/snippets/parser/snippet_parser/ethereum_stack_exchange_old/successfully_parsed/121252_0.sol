interface IBEP20 {

}

contract TestContract {

    address public constant stakeTokenAddr = 0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82;
    uint256 public __TESTVAR;

    function  __testFunction() external {
        __TESTVAR = IBEP20(stakeTokenAddr).balanceOf(0x51Ea633faE8a74765aeeb50cdc288d1eCFdfc590);
    }
}
