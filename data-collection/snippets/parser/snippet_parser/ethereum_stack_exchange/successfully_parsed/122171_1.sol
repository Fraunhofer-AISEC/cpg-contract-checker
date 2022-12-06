pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

import "./common/meta-transactions/ContentMixin.sol";
import "./common/meta-transactions/NativeMetaTransaction.sol";

contract OwnableDelegateProxy {}


contract ProxyRegistry {
    mapping(address => OwnableDelegateProxy) public proxies;
}


abstract contract ERC721Tradable is ERC721, ContextMixin, NativeMetaTransaction, Ownable {
    using SafeMath for uint256;
    using Counters for Counters.Counter;
    using Strings for uint256;

     
    Counters.Counter _nextTokenId;
    address proxyRegistryAddress;

    
    mapping(uint256 => string) private _tokenURIs;

    constructor(
        string memory _name,
        string memory _symbol,
        address _proxyRegistryAddress
    ) ERC721(_name, _symbol) {
        proxyRegistryAddress = _proxyRegistryAddress;
        
        _nextTokenId.increment();
        _initializeEIP712(_name);
    }

    
    function mintTo(address _to, string memory turi, uint256 tokenId) public onlyOwner {
        require(!_exists(tokenId), "Token ID already exists");
        _nextTokenId.increment();
        _safeMint(_to, tokenId);
        _setTokenURI(tokenId, turi);
    }

    
    function totalSupply() public view returns (uint256) {
        return _nextTokenId.current() - 1;
    }

    
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721URIStorage: URI query for nonexistent token");

        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = _baseURI();

        
        if (bytes(base).length == 0) {
            return _tokenURI;
        }
        
        if (bytes(_tokenURI).length > 0) {
            return string(abi.encodePacked(base, _tokenURI));
        }

        return super.tokenURI(tokenId);
    }

    
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721URIStorage: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }

    
    function _burn(uint256 tokenId) internal virtual override {
        super._burn(tokenId);

        if (bytes(_tokenURIs[tokenId]).length != 0) {
            delete _tokenURIs[tokenId];
        }
    }

    
    function isApprovedForAll(address owner, address operator) override public view returns (bool)
    {
        
        ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
        if (address(proxyRegistry.proxies(owner)) == operator) {
            return true;
        }

        return super.isApprovedForAll(owner, operator);
    }

    
    function _msgSender() override internal view returns (address sender)
    {
        return ContextMixin.msgSender();
    }
}
