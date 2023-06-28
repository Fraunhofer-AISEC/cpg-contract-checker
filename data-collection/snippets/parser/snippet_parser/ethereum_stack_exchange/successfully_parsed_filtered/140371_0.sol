    function callAndTransfer721(bytes memory inputs, address protocol)
    internal
    returns (bool success, bytes memory output)
{
    (uint256 value, bytes memory data, address recipient, address token, uint256 id) =
        abi.decode(inputs, (uint256, bytes, address, address, uint256));
    (success, output) = protocol.call{value: value}(data);
    if (success) ERC721(token).safeTransferFrom(address(this), recipient.map(), id);
}
