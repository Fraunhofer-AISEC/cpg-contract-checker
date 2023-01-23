
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface IMinting is IERC721 {
    function mint() external;
}

abstract contract Minting is IMinting {
    function mint() external {
        if (balanceOf(msg.sender) > 0) revert Minting__AlreadyMinted();
        _safeMint(msg.sender, 1);
    }

    function balanceOf(address) public view virtual returns (uint256);

    function _safeMint(address, uint256) internal virtual;

    error Minting__AlreadyMinted();
}

contract Token is ERC721, Minting {
    constructor(string memory name_, string memory symbol_)
        ERC721(name_, symbol_)
    {}

    function balanceOf(address owner)
        public
        view
        override(ERC721, Minting)
        returns (uint256)
    {
        return ERC721.balanceOf(owner);
    }

    function _safeMint(address to, uint256 tokenId)
        internal
        virtual
        override(ERC721, Minting)
    {
        return ERC721._safeMint(to, tokenId);
    }
}
