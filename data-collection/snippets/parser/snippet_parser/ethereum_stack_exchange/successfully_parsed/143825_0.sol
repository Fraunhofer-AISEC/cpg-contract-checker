 interface ISafe {
 function encodeTransactionData(
    address to,
    uint256 value,
    bytes calldata data,
    Enum.Operation operation,
    uint256 safeTxGas,
    uint256 baseGas,
    uint256 gasPrice,
    address gasToken,
    address refundReceiver,
    uint256 _nonce
) external view returns (bytes memory);
}