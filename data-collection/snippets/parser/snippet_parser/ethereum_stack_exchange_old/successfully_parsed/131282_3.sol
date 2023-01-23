function verify(forwardData calldata data, bytes calldata signature) internal view returns (address)
{
    return _hashTypedDataV4(
        keccak256(abi.encode(
            typeHash,
            data.from,
            keccak256(abi.encodePacked(data.name)) 
        ))
    ).recover(signature);
}
