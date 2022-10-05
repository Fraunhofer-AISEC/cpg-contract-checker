pragma solidity ^0.5.0;

contract Test
{
    function encode(uint256 a, string calldata b) external pure returns(string memory)
    {
        return string(abi.encode(a, b));
    }
    function decode(string calldata a) external pure returns(uint256, string memory)
    {
        return abi.decode(bytes(a), (uint256, string));
    }
}
