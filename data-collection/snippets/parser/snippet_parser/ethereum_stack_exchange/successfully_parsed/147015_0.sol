
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFToken is ERC721, ERC721URIStorage, ERC721Burnable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("NFtToken", "NFTT") {}

    mapping(uint256=>mapping(address=>uint256)) public mRoyaltyPercentage;
    mapping(uint256=>address) public mMinter ;

    function getMinter(uint256 _tokenid) external view returns(address _minterAddress) 
    {
        return mMinter[_tokenid];
    }

    function getRoyaltyPercentage(uint256 _tokenid , address _address) external view returns(uint256 _royaltyPercentage)
    {
        return mRoyaltyPercentage[_tokenid][_address];
    }

    function safeMint(address to, string memory uri , uint256 _royaltypercentage) public 
    {
        require(to != address(0) , "NFT:: invalid address"); 
        require(_royaltypercentage >= 150 && _royaltypercentage <=1000 , "NFT:: invalid royalty percentage | should be in between from 1.5% to 10%");

        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        
        mMinter[tokenId] = to;
        mRoyaltyPercentage[tokenId][address(this)] = _royaltypercentage ;

        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}
