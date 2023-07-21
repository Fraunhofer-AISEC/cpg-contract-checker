pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";

interface ICustomERC721 is IERC721Enumerable {
    function maxSupply() external view returns (uint256);
}
