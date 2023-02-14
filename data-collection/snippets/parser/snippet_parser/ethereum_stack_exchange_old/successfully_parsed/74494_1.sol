pragma solidity 0.5.1;

contract A {

    bytes private finalBytes;


    function setBytesCombined() external {
        bytes20 address_string = toBytes(msg.sender);

        bytes1 separator = bytes1(";");

        
        string memory combinedStringEmpty = new string(address_string.length + separator.length);

        bytes memory combinedBytes = bytes(combinedStringEmpty);

        uint iter = 0;

        for (uint i = 0; i < address_string.length; i++) {
            combinedBytes[iter++] = address_string[i];
        }

        for (uint i = 0; i < separator.length; i++) {
            combinedBytes[iter++] = separator[i];
        }

        finalBytes = bytes(combinedBytes);
    }

    function getBytesCombined() public view returns(bytes memory) {
        return finalBytes;
    }

    function toBytes(address a) internal pure returns (bytes20 b) {
        return bytes20(uint160(a));
    }
}
