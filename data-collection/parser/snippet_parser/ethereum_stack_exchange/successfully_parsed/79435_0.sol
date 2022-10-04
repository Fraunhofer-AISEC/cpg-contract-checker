struct test {
 address a;
 uint256 b;
 bytes32 c;
 address d;
}


test newTest = test({
 a: address(0),
 b: 1,
 c: bytes32(0),
 d: address(0)
});
