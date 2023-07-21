
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.4.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.2/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.4.2/access/Ownable.sol";


contract MyToken is ERC721, ERC721Enumerable, Ownable {
    string public contractURI;
    uint96 royaltyFeesInBips;
    address royaltyAddress;

    constructor(uint96 _royaltyFeesInBips, string memory _contractURI) ERC721("MyToken", "MTK") {
        royaltyFeesInBips = _royaltyFeesInBips;
        royaltyAddress = owner();
        contractURI = _contractURI;
        
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }

    function setRoyaltyInfo(address _receiver, uint96 _royaltyFeesInBips) public onlyOwner {
        royaltyAddress = _receiver;
        royaltyFeesInBips = _royaltyFeesInBips;
    }

    function setContractURI(string calldata _contractURI) public onlyOwner {
        contractURI = _contractURI;
    }

    
    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function royaltyInfo(uint256 _tokenId, uint256 _salePrice)
        external
        view
        virtual
        override
        returns (address, uint256)
    {
        return (royaltyAddress, calculateRoyalty(_salePrice));
    }

    function calculateRoyalty(uint256 _salePrice) pure public returns (uint256) {
        return (_salePrice / 10000) * royaltyFeesInBips;
    }

    function supportsInterface(bytes4 interfaceId)
            public
            view
            override(ERC721, ERC721Enumerable)
            returns (bool)
    {
        return interfaceId == 0x2a55205a || super.supportsInterface(interfaceId);
    }
}
