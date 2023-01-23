bytes4 private constant FUNC_SELECTOR = bytes4(keccak256("someFunc(address,uint256)"));

function func(address _contract, address _param1, uint256 _param2) view returns (uint256, uint256) {
    bytes memory data = abi.encodeWithSelector(FUNC_SELECTOR, _param1, _param2);
    (bool success, bytes memory returnData) = address(_contract).staticcall(data);
    if (success) {
        if (returnData.length == 64)
            return abi.decode(returnData, (uint256, uint256));
        if (returnData.length == 32)
            return (abi.decode(returnData, (uint256)), 0);
    }
    return (0, 0);
}
