pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TheCondemned_Episode is ERC721URIStorage, ERC721Enumerable, Ownable {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string[] public episodes;
     

    mapping(string => bool) _episodeExists;

    event episodeCreated (string _episodeName, string _tokenURI);

    constructor() ERC721("TheCondemned_e1", "TCe1") {
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory _tokenURI) {
        super.tokenURI(tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

        function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }


    function mint(string memory _episodeName, string memory _tokenURI) external onlyOwner {
        require(!_episodeExists[_episodeName]);
        require(episodes.length < 13, "Cannot make more than 13 episodes");

        episodes.push(_episodeName);
        _tokenIds.increment(); 

        uint256 newNftTokenId = _tokenIds.current();
        address receiver= msg.sender;
        _mint(receiver, newNftTokenId);
        _setTokenURI(newNftTokenId, _tokenURI);

        _episodeExists[_episodeName]= true;
        emit episodeCreated(_episodeName, tokenURI(newNftTokenId));
       


    }
}
