

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.4/contracts/token/ERC721/ERC721Upgradeable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.4/contracts/utils/CountersUpgradeable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.4/contracts/access/OwnableUpgradeable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.4/contracts/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.4/contracts/proxy/utils/Initializable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.4/contracts/utils/ContextUpgradeable.sol";



contract MintDropsNFT is
    Initializable,
    ContextUpgradeable,
    OwnableUpgradeable,
    ERC721URIStorageUpgradeable
{

    using CountersUpgradeable for CountersUpgradeable.Counter;
    CountersUpgradeable.Counter private _tokenIds;

    function initialize(address owner) initializer public {
        __ERC721_init_unchained("MintDrops", "MDROPS");
        __Ownable_init_unchained();
        __Context_init_unchained();
    }

    function send(address recipient, uint256 tokenId) public  onlyOwner {
        safeTransferFrom(address (this),recipient,tokenId);
    }

    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function airDrop(address recipient, string memory tokenURI) 
        public onlyOwner
        returns (uint256)
    {
        uint256 tokenId = mintNFT(recipient, tokenURI);
        send(recipient, tokenId);

        return tokenId;
    }
}
