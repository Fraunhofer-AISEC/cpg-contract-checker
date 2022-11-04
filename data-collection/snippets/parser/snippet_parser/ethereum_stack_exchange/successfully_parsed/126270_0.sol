
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "base64-sol/base64.sol";

contract vjkNFT is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    event CreatedSVGNFT(uint256 indexed tokenId, string tokenURI);

    struct CollectionStruct {
    address sender;
    string tokenId;
    string svg;
    uint256 timestamp;
    }

    constructor() ERC721("brunovjk NFT", "vjkNFT")
    {
        tokenCounter = 0;
    }

    CollectionStruct[] collections;

    function create(string memory svg) public {
        _safeMint(msg.sender, tokenCounter);
        string memory imageURI = svg;
        _setTokenURI(tokenCounter, formatTokenURI(imageURI, tokenCounter));        
        collections.push(CollectionStruct(msg.sender, uint2str(tokenCounter), svg, block.timestamp));
        emit CreatedSVGNFT(tokenCounter, svg);
        tokenCounter = tokenCounter + 1;
    }
    function getAllCollections() public view returns (CollectionStruct[] memory) {
        return collections;
    }
    function formatTokenURI(string memory imageURI, uint256 tokenCounterr) public pure returns (string memory) {
        return string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"',uint2str(tokenCounterr),'", "image":"',imageURI,'"}'
                            )
                        )
                    )
                )
            );
    }
            function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }

}


