function burn (address foo, uint256 id) external {
address contractFoo = 0x12000notFakeAddress00012739
    (bool burned,) = address(contractFoo).call(
        abi.encodeWithSignature("burn(address,uint256,uint256)", foo, id, 1)
    );
    require(burned, "Burn Failed");
}
