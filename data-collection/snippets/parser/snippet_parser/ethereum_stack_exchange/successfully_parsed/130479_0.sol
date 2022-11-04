
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract MyTestNft is ERC721URIStorage {
    uint256 private _tokensCount = 0;
    address public minter = address(0);

    event LogMint(address to, uint256 tokenId, uint256 tokensCount, address minter, address sender);

    modifier onlyMinter(){
        require(
            minter == msg.sender,
            'Invalid Minter: ...'
        );
        _;
    }

    constructor() ERC721("MyTestNft", "MTN") {
        minter = msg.sender;
    }

    function mint(address to) external onlyMinter {
        uint256 tokenId = _tokensCount + 1;
        _mint(to, tokenId);
        _tokensCount = tokenId;
        emit LogMint(to, tokenId, _tokensCount, minter, msg.sender);
    }

}

