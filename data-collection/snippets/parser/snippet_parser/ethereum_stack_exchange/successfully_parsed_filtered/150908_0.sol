
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TransferRestrictedNFT is ERC721 {
    uint256 private immutable MAX_TOKEN_TRANSFERS;
    mapping(uint256 => uint256) private _tokenTransfers;

    constructor(
        string memory name,
        string memory symbol,
        uint256 maxTokenTransfers
    ) ERC721(name, symbol) {
        MAX_TOKEN_TRANSFERS = maxTokenTransfers;
    }

    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        require(
            _tokenTransfers[tokenId] < MAX_TOKEN_TRANSFERS,
            "<YOUR ERROR MESSAGE>"
        );
        _tokenTransfers[tokenId]++;
        super._transfer(from, to, tokenId);
    }
}
