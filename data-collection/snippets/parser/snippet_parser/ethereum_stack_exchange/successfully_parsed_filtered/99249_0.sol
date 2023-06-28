pragma solidity ^0.5.16;
import "./ERC721/ERC721Token.sol";


contract DeedRepository is ERC721Token {



    
    constructor(string memory _name, string memory _symbol) 
        public ERC721Token(_name, _symbol) {}
    
    
    function registerDeed(uint256 _tokenId, string memory _uri) public {
        _mint(msg.sender, _tokenId);
        addDeedMetadata(_tokenId, _uri);
        emit DeedRegistered(msg.sender, _tokenId);
    }

    function getTotalNFTCount () public view returns (uint) {
        return totalSupply();
    }


    
    function addDeedMetadata(uint256 _tokenId, string memory _uri) public returns(bool){
        _setTokenURI(_tokenId, _uri);
        return true;
    }

    
    event DeedRegistered(address _by, uint256 _tokenId);
}
