
pragma solidity >=0.8.0;

contract Example {
    bytes4 public data = 0xa22cb465;

    function howToUseIt() public view returns (string memory) {
        return iToHex(abi.encodePacked(data));
    }

    function iToHex(bytes memory buffer) public pure returns (string memory) {

        
        bytes memory converted = new bytes(buffer.length * 2);

        bytes memory _base = "0123456789abcdef";

        for (uint256 i = 0; i < buffer.length; i++) {
            converted[i * 2] = _base[uint8(buffer[i]) / _base.length];
            converted[i * 2 + 1] = _base[uint8(buffer[i]) % _base.length];
        }

        return string(abi.encodePacked("0x", converted));
    }
}
