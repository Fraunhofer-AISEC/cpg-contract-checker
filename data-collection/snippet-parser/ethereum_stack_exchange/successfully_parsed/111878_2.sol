
pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

import "./MyERC721.sol";
import "./interfaces/ICollectionManager.sol";

contract CollectionManager is ICollectionManager {
  
  mapping(address => address[]) public collectionsOf;
  mapping(address => Collection) public collection;
  
  function createCollection(string memory name, string memory symbol) external {
    MyERC721 newCollection = new MyERC721(name, symbol, address(this));
    
    address collectionAddress = address(newCollection);
    address sender = msg.sender;

    collection[collectionAddress].status = Status.Inactive;
    collection[collectionAddress].owner = sender;
    
    
    collectionsOf[sender].push(collectionAddress);

    emit CollectionCreated(sender, collectionAddress, block.timestamp);
  }

  function setCollectionActive(address collectionAddress) external {
    collection[collectionAddress].status = Status.Active;

    emit CollectionActivated(collectionAddress, block.timestamp);
  }

  function mint(address collectionAddress) external {
    uint256 tokenId = collection[collectionAddress].tokenIdCounter + 1;

    collection[collectionAddress].tokenIdCounter = tokenId;
    
    MyERC721(collectionAddress).safeMint(msg.sender, tokenId);
  }

  function balanceOf(address collectionAddress) external view returns(uint256) {
    return MyERC721(collectionAddress).balanceOf(msg.sender);
  }

  function totalSupply(address collectionAddress) external view returns(uint256) {
    return ERC721Enumerable(collectionAddress).totalSupply();
  }
}
