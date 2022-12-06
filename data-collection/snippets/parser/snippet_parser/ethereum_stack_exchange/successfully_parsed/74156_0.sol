pragma solidity >= 0.5.0;

library GetName {
    function readOptional(address addr, bytes memory data) internal view returns (bytes memory result) {
        bool success;
        bytes memory retData;
        (success, retData) = addr.staticcall(data);
        if (success) {
            return retData;
        } else {
            return abi.encode(0x0);
        }
    }

    function getNameOrEmpty(address addr) internal view returns (string memory result) {
        return abi.decode(readOptional(addr, abi.encodeWithSignature("name()")), (string));
    }
}

contract Testing {
    using GetName for address;

    mapping (address => string) public record;

    function recordName(address addr) public {
        record[addr] = addr.getNameOrEmpty();
    }
}
