
pragma solidity ^0.5.17;


import "@openzeppelin/contracts@2.5.1/token/ERC721/ERC721Full.sol";

contract DevToken is ERC721Full {
  uint public index;

  struct Nft {
    string nftTitle;     
    string nftLink;
    string metaLink;
    address nftCreator;
  } 
  
  mapping(uint => Nft) nfts; 
  mapping(address => uint) ownerNftCount;
  mapping(uint => address) ownerOfNft;
  mapping(address => mapping(uint => uint)) ownerNftList;
  
  event TokenCreated(
        uint indexed _tokenId,      
        address indexed _address
    );

    constructor() ERC721Full("Dev NFT", "Dev") public {
    index = 0;
  }

  function createNft(string memory _nftTitle,                    
                     string memory _nftLink,
                     string memory _metaLink) public returns (uint) {    
    index += 1;
    _mint(msg.sender, index);
    _setTokenURI(index, _metaLink);

    Nft memory nft;
    nft.nftTitle = _nftTitle;  
    nft.nftLink = _nftLink;
    nft.metaLink = _metaLink;
    nft.nftCreator = msg.sender;      
    nfts[index] = nft;

    ownerNftCount[msg.sender] += 1;
    ownerNftList[msg.sender][ownerNftCount[msg.sender]] = index;
    ownerOfNft[index] = msg.sender;
  
    emit TokenCreated(index, msg.sender);

    return index;
  }  





  function getNftTitle(uint _key) public view returns (string memory) {  
    return nfts[_key].nftTitle;
  }

  function getNftLink(uint _key) public view returns (string memory) {  
    return nfts[_key].nftLink;
  }
  
  function getNftMeta(uint _key) public view returns (string memory) {  
    return nfts[_key].metaLink;
  }

  function getNftCreator(uint _key) public view returns (address) {  
    return nfts[_key].nftCreator;
  }
  
  function getOwnerNftCount(address _key) public view returns (uint) {  
    return ownerNftCount[_key];
  } 

  function getOwnerOfNft(uint _key) public view returns (address) {  
    return ownerOfNft[_key];
  } 

  function getOwnerNftList(address _to, uint _key) public view returns (uint) {  
    return ownerNftList[_to][_key];
  } 
}

