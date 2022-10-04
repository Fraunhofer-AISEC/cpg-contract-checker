
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MarsToken is ERC721PresetMinterPauserAutoId {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    
    address public owner = msg.sender;
    
    struct Land{
        string baseURI;
        uint256 initialPrice;
    }
    
    mapping(uint256 => Land) public landbyTokenId;
 

    constructor() ERC721PresetMinterPauserAutoId("MarsToken", "MARS", "https://mars.nasa.gov/") {}

    
    modifier landRegistered(uint tokenId) {
        require(_exists(tokenId), "MarsAuction: Land isn't registered!");
        _;
    }
    
    function mintLand(string memory _baseURI, uint256 price) public returns(uint) {
        require(hasRole("MINTER_ROLE", msg.sender), "MarsToken: Not Authorized to mint");
        _tokenIds.increment();
        uint tokenId = _tokenIds.current();
        _mint(owner, tokenId);
        landbyTokenId[tokenId] = Land(_baseURI, price);
        return tokenId;
    }
    
    
}
