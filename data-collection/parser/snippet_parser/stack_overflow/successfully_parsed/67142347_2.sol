
pragma solidity ^0.6.0;

import "../../GSN/Context.sol";
import "./ERC721.sol";
import "./IERC721Metadata.sol";
import "../../introspection/ERC165.sol";

contract ERC721Metadata is Context, ERC165, ERC721, IERC721Metadata {
    
    string private _name;

    
    string private _symbol;

    
    string private _baseURI;

    
    mapping(uint256 => string) private _tokenURIs;

    
    bytes4 private constant _INTERFACE_ID_ERC721_METADATA = 0x5b5e139f;

    
    constructor (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;

        
        _registerInterface(_INTERFACE_ID_ERC721_METADATA);
    }

    
    function name() external view override returns (string memory) {
        return _name;
    }

    
    function symbol() external view override returns (string memory) {
        return _symbol;
    }

    
    function tokenURI(uint256 tokenId) external view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory _tokenURI = _tokenURIs[tokenId];

        
        if (bytes(_tokenURI).length == 0) {
            return "";
        } else {
            
            return string(abi.encodePacked(_baseURI, _tokenURI));
        }
    }

    
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721Metadata: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }

    
    function _setBaseURI(string memory baseURI) internal virtual {
        _baseURI = baseURI;
    }

    
    function baseURI() external view returns (string memory) {
        return _baseURI;
    }


    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal virtual override {
        super._beforeTokenTransfer(from, to, tokenId);

        if (to == address(0)) { 
            
            if (bytes(_tokenURIs[tokenId]).length != 0) {
                delete _tokenURIs[tokenId];
            }
        }
    }
}

