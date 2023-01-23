pragma solidity ^0.5.0;

import "./ERC721Full.sol";

contract NftShop is ERC721Full {
  string public name;
  Image[] public nft;
  uint public imageId = 0;
  mapping(uint => bool) public _nftExists;
  mapping(uint => Image) public images;

  struct Image {
    uint id;                  
    string hash;              
    string description;       
    string collection;        
    address payable author;   
  }

  
  event TokenCreated(
    uint id,
    string hash,
    string description,
    string collection,
    address payable author
  );

  constructor() public payable ERC721Full("NftShop", "NFTSHOP") {
    name = "NftShop";
  }

  
  function uploadImage(string memory _imgHash, string memory _description, string memory _collection) public {
    
    require(bytes(_imgHash).length > 0);
    
    require(bytes(_description).length > 0);
    
    require(bytes(_collection).length > 0);
    
    require(msg.sender!=address(0));

    
    imageId ++;

    
    images[imageId] = Image(imageId, _imgHash, _description, _collection, msg.sender);

    
    require(!_nftExists[imageId]);
    uint _id = nft.push(images[imageId]);
    _mint(msg.sender, _id);
    _nftExists[imageId] = true;

    
    emit TokenCreated(imageId, _imgHash, _description, _collection, msg.sender);
  }
} 
