pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Strings.sol";
...
    using Strings for uint256;
    using Base64 for bytes;
...
    function tokenURI(uint256 id) public view returns (string memory) {

        string memory metadata = string(abi.encodePacked(
            "{\"name\": \"NFT#",
            id.toString(),
            "\", \"description\": \"A simple NFT\", \"attributes\":",
            "[{\"key\":\"trait_type\",\"value\":\"1\"}]",
            "}"
        ));

        return string(abi.encodePacked(
            "data:application/json;base64,",
            bytes(metadata).base64()
        ));
    }
