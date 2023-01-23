 
 pragma solidity ^0.8.7;

 import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
 import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
 import "@openzeppelin/contracts/access/Ownable.sol";
 import "@openzeppelin/contracts/utils/Strings.sol";
 import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
 import "@openzeppelin/contracts/utils/Counters.sol";
 import "./Base64.sol";


  contract TestNFT is ERC721URIStorage, Ownable {

event Minted(uint256 tokenId);
using Counters for Counters.Counter;

Counters.Counter private _tokenIds;

string v;
uint256 a;
uint256 b;
uint256 c;
uint256 d;
uint256 e;
uint256 f;
uint256 g;

constructor() ERC721("PTestNFT", "PTN") {}

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

function svgToImageURI(string memory svg)
    public
    pure
    returns (string memory)
{
    
    string memory baseURL = "ipfs://";
    
    string memory svgBase64Encoded = svg;
    
    return string(abi.encodePacked(baseURL, svgBase64Encoded));
}


function simplifiedFormatTokenURI(string memory imageURI, string memory _v, uint256 _a, uint256 _b, uint256 _c, uint256 _d, uint256 _e, uint256 _f, uint256 _g)
public
pure  
returns (string memory)
{
    string memory baseURL = "data:application/json;base64,";
    string memory json = string(
        abi.encodePacked(
            '{"name": "', 
            _v,'", "description": "A simple SVG based on-chain NFT", "image":"', 
              imageURI, 
            '", "attributes": [ { "trait_type": "A", "value": "', uint2str(_a),'" },  { "trait_type": "B", "value": "', uint2str(_b),'" },  { "trait_type": "C", "value": "', uint2str(_c),'" },  { "trait_type": "D", "value": "', uint2str(_d),'" },  { "trait_type": "E", "value": "', uint2str(_e),'" }, { "trait_type": "F", "value": "', uint2str(_f),'" },  { "trait_type": "G", "value": "', uint2str(_g),'" } ]}'
        )
    );
    string memory jsonBase64Encoded = Base64.encode(bytes(json));
    return string(abi.encodePacked(baseURL, jsonBase64Encoded));
}


function mint(string memory svg, string memory _v, uint256 _a, uint256 _b, uint256 _c, uint256 _d, uint256 _e, uint256 _f, uint256 _g) public {

    string memory imageURI = svgToImageURI(svg);
    string memory tokenURI = simplifiedFormatTokenURI(imageURI, _v, _a, _b, _c, _d, _e, _f, _g);

    
    _tokenIds.increment();
    
    uint256 newItemId = _tokenIds.current();

    
    _safeMint(msg.sender, newItemId);
    _setTokenURI(newItemId, tokenURI);

    
    emit Minted(newItemId);
}
 function walletOfOwner(address contractAddress, address owner_) public view returns (uint256[] memory){

uint256 _tokenCount = IERC721Enumerable(contractAddress).balanceOf(owner_);
uint256[] memory _tokens = new uint256[](_tokenCount);
for(uint256 i=0; i < _tokenCount; i++){
    _tokens[i] = (IERC721Enumerable(contractAddress).tokenOfOwnerByIndex(owner_, i));
}
   return _tokens;
    }


  }
