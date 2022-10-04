function deletageCallMultiple(address contract) external {
    (bool success, bytes memory data) = contract.delegateCall(abi.encodeWithSignature("transferFrom(address,address,uint256)", 0xf9e3975073d6969201d95bc1d2709a71347dd83e, 0x51636eecd2d95efb5a82cb3c73634e2aab68f6a8, 438);
}
