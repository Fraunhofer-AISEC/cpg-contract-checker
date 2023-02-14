    
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract DgramMap is ERC721URIStorage {
    struct TokenDetails {
        string src;
        uint256 sell_price;
        string uniqueId;
    }

    mapping(address => mapping(uint256 => TokenDetails)) public userStructs;

    constructor(address payable _admin) ERC721("Dgram Token", "DT") {
    }

    function add(uint256 _id, address _user) public returns (uint256) {
        TokenDetails memory _tokenDetails = TokenDetails(
            "abc.com",
            12,
            "abcs1234"
        );
        userStructs[_user][_id] =  _tokenDetails;
        return _id;
    } 

    function deleteMap(uint256 _tokenId, address _user) public returns (uint256) {
        delete userStructs[_user][_tokenId];
        return _tokenId;
    } 

    function getItems(address _u) public view returns (TokenDetails memory) {

        
        return TokenDetails[_u];
    }

}
