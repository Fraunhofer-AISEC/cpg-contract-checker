function getSelectorOne() public pure returns (bytes4 selector) {
    selector = bytes4(keccak256(bytes("transfer(address,uint256)")));
}

function callTransferFunctionDirectly(address someAddress, uint256 amount)
        public
        returns (bytes4, bool)
{
    (bool success, bytes memory returnData) = address(this).call(
        
        abi.encodeWithSelector(getSelectorOne(), someAddress, amount)
    );
    return (bytes4(returnData), success);
}
