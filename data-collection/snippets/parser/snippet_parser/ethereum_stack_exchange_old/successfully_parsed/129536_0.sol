function encodeAmount(
    uint256 amount,
    bytes memory data
) public pure returns(bytes memory){
    bytes memory amountToEncode = abi.encode(amount);
    assembly {
        mstore(add(add(data, 32), 68), mload(add(amountToEncode, 32)))
    }
    return data;
}
