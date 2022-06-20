pragma solidity ^0.8;

contract MyContract {
    function concat(string[] calldata words) external pure returns (string memory) {
        bytes memory output;

        for (uint256 i = 0; i < words.length; i++) {
            output = abi.encodePacked(output, words[i]);
        }

        return string(output);
    }
}
