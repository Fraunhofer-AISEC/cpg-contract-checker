

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

import "./ContentMixin.sol";
import "./NativeMetaTransaction.sol";

contract OwnableDelegateProxy {}


contract ProxyRegistry {
    mapping(address => OwnableDelegateProxy) public proxies;
}


abstract contract ERC721Tradable is ERC721, ContextMixin, NativeMetaTransaction, Ownable {
    using SafeMath for uint256;
    using Counters for Counters.Counter;

    Counters.Counter private _nextTokenId;
    address proxyRegistryAddress;

    constructor(
        string memory _name,
        string memory _symbol,
        address _proxyRegistryAddress
    ) ERC721(_name, _symbol) {
        proxyRegistryAddress = _proxyRegistryAddress;
        
        _nextTokenId.increment();
        _initializeEIP712(_name);
    }

    
    function mintTo(address _to) public onlyOwner {
        uint256 currentTokenId = _nextTokenId.current();
        _nextTokenId.increment();
        _safeMint(_to, currentTokenId);
    }

    
    function totalSupply() public view returns (uint256) {
        return _nextTokenId.current() - 1;
    }

    function baseTokenURI() virtual public view returns (string memory);

    function tokenURI(uint256 _tokenId) override public view returns (string memory) {
        return string(abi.encodePacked(baseTokenURI(), Strings.toString(_tokenId)));
    }

    
    function isApprovedForAll(address owner, address operator)
        override
        public
        view
        returns (bool)
    {
        
        ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
        if (address(proxyRegistry.proxies(owner)) == operator) {
            return true;
        }

        return super.isApprovedForAll(owner, operator);
    }

    
    function _msgSender()
        internal
        override
        view
        returns (address sender)
    {
        return ContextMixin.msgSender();
    }
}
