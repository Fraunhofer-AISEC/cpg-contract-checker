
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.3/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.7.3/utils/Counters.sol";


contract testcontract is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string private _customBaseURI;

    constructor(string memory customBaseURI_) ERC721("Token","TKT"){
        _customBaseURI = customBaseURI_;
    }

    function setBaseURI(string memory customBaseURI_) public {
        _customBaseURI = customBaseURI_;
    }

    function _baseURI() internal view virtual override returns (string memory){
        return _customBaseURI;
    }

    function _getbaseURI() public view returns(string memory){
        return _customBaseURI;
    }
}
