contract B {
    address addrOfA;
    function b() public returns(uint256) {
        (, bytes memory returnData) = addrOfA.delegatecall(abi.encodeWithSingature("a()");
        return uint256(returnData);
    }
}
