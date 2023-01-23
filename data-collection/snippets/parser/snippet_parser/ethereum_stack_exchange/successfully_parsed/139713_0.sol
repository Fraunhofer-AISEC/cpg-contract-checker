
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface IMinting is IERC721 {
    function mint() external;
}

contract Minting is ERC721, IMinting {
    function mint() external {
        if (balanceOf(msg.sender) > 0) revert Minting__AlreadyMinted();
        _safeMint(msg.sender, 1);
    }

    error Minting__AlreadyMinted();
}
