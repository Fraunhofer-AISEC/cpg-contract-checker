
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "./base64.sol";

contract Test is ERC721Enumerable, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    using Strings for uint256;

    string private _contractURI;

    constructor() ERC721("Test", "T") {}

    function svgToImageURI(string memory _source) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(_source))));
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }

    function formatTokenURI(string memory _imageURI, string memory _name, string memory _description, string memory _properties) public pure returns (string memory) {
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name":"', _name,
                            '", "description": "', _description, '"',
                            ', "attributes": ', _properties,
                            ', "image":"', _imageURI, '"}'
                        )
                    )
                )
            )
        );
    }

    function setTokenURI(uint256 _tokenId, string memory _tokenURI) public onlyOwner() {
        _setTokenURI(_tokenId, _tokenURI);
        emit tokenChanged(_tokenId);
    }

    function setContractURI(string memory contractURI_) public onlyOwner() {
        _contractURI = string(abi.encodePacked(
            "data:application/json;base64,",
            Base64.encode(
                bytes(
                    abi.encodePacked(
                        contractURI_
                    )
                )
            )
        ));
    }

    function contractURI() public view returns (string memory) {
        return _contractURI;
    }
}
