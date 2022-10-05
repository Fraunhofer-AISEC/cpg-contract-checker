function testCall(uint amount) public virtual returns (bool) {
address tta = address(0xE7B6....);    
    
(bool success, bytes memory result) = tta.delegatecall(abi.encodeWithSignature("approve(address, uint256)", address(this), amount));
return success;
}
