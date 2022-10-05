
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract CMRGachaSeedNFT is ERC721URIStorage, AccessControl, ERC721Enumerable {
    bytes32 public constant CONTRACT_ROLE = keccak256("CONTRACT_ROLE");

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    ...
    
    
    function mintItem(address _address, string memory _tokenURI)
        public
        onlyRole(CONTRACT_ROLE)
        returns (uint256)
    {
        

        
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(_address, newItemId);
        _setTokenURI(newItemId, _tokenURI);

        return newItemId;
    }
}
