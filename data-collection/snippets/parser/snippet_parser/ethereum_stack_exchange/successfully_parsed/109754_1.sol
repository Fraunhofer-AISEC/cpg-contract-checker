pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyContract is ERC721 {

    mapping(uint256 => string) private _CIDS;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(string => uint8) hashes;

    constructor() ERC721("MYNFT", "MNT") public {
    }

    function CID(uint256 tokenId) public view returns (string memory) {

      require(_exists(tokenId), "ERC721Metadata: CID query for nonexistent token");
      string memory _CID = _CIDS[tokenId];

      return _CID;
    }

    function _setTokenCID(uint256 tokenId, string memory _CID) internal virtual {
      require(_exists(tokenId), "ERC721Metadata: CID set of nonexistent token");
      _CIDS[tokenId] = _CID;
    }

    function mint(string memory _CID, string memory metadata) public {
      require(hashes[_CID] != 1);
      hashes[_CID] = 1;

      uint256 _newId = totalSupply() + 1;
      _safeMint(msg.sender, _newId);
      _setTokenCID(_newId, _CID);

      _setTokenURI(_newId, metadata);
      
    }
    
}

