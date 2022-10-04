contract TestContract is MyContract {
    uint16[] deps;
    function testUpdateDeps() {
        deps.push(uint16(2));
        deps.push(uint16(3));
        deps.push(uint16(4));

        (bool success, bytes memory result) = address(this).delegatecall(abi.encodeWithSignature("updateDeps(uint16, uint16[])", 1, deps));
        Assert.ok(success, "should succeed");
    }
}
