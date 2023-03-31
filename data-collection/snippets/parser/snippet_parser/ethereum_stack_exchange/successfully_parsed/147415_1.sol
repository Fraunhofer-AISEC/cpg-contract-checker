function test_fee_too_large(uint256 fee) public {
    vm.assume(fee > 1 ether);
    hoax(alice);
    bytes4 selector = bytes4(keccak256("WrongInitiationFee(address)"));
    vm.expectRevert(abi.encodeWithSelector(selector, alice));
    emit log_named_uint("fee", fee);
    dao.join{value: 100 ether}();
}
