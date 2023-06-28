

pragma solidity 0.8.18;

contract StringsAndBytes {
    function packString(string[] memory list) external pure returns (bytes memory){
        bytes memory packedArray;
        if (list.length == 0) {
            return packedArray;
        }
        packedArray = abi.encodePacked(list[0]);
        for (uint i = 1; i < list.length; i++) {
            packedArray = abi.encodePacked(packedArray, hex"00", list[i]);
        }
        return packedArray;
    }

    function unpackString(bytes memory pack) external pure returns (string[] memory) {
        if (pack.length == 0) {
            string[] memory emptyArray;
            return emptyArray;
        }
        uint256 elementCount = 1;
        for (uint i = 0; i < pack.length; i++) {
            if (pack[i] == 0x00) {
                elementCount++;
            }
        }
        string[] memory list = new string[](elementCount);
        uint256 arrayIndex = 0;
        string memory element = "";
        for (uint i = 0; i < pack.length; i++) {
            if (pack[i] == 0x00) {
                list[arrayIndex] = element;
                element = "";
                arrayIndex++;
                continue;
            }
            element = string(abi.encodePacked(element, pack[i]));
        }
        list[arrayIndex] = element;
        return list;
    }
}
