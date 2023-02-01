
pragma solidity >=0.4.20;
import '@openzeppelin/contracts/token/ERC721/ERC721.sol';


contract token is ERC721 {
    address contractOwner;
      bytes32[] array_proof;
      bytes32 hash;

    constructor() ERC721("supplychain", "SCP") public {
         contractOwner=msg.sender;
    }
    bytes32 tokenID;
enum State{
    producedBySupplier,
    forSaleBySupplier,
    purchasedByManufacturer,
    shippedBySupplier,
    receivedByManufacturer,
    packagedByManufacturer,
    forSaleByManufacturer,
    purchasedByRetailer,
    shippedByManufacturer,
    receivedByRetailer
}
    struct Item {
    uint product_code;
    address ownerID;
    State itemState;
    uint price;
      }
    struct Nugget{
        uint product_code;
        address ownerID;
        State NuggetState;
      
        
    }

    
  mapping(bytes32 => Item ) itemInfo;
  
  
  mapping(bytes32 => Nugget) nuggetInfo;
   mapping(uint => uint) nuggetMap;

   
  event lognewItem(bytes32 tokenID,uint createdAt); 
event lognewNugget(bytes32 tokenID, uint createdAt);
event _purchasedByManufacturer(bytes32 tokenID, uint createdAt);

 
modifier arrayproof(address receiver, uint createdAt){
       hash=sha256(abi.encodePacked(msg.sender,receiver,createdAt));
 array_proof.push(hash);
 _;
  }


  function itemBySupplier(uint weight, uint flavor, uint qty, uint productType)public arrayproof(msg.sender, block.timestamp) returns(uint ) {
    
    

          tokenID= sha256(abi.encodePacked(weight, flavor, qty, productType));
          Item memory newItem = Item(uint(tokenID),msg.sender,State.producedBySupplier,uint(0));
          _mint(msg.sender,uint(tokenID));
           emit lognewItem(tokenID,block.timestamp);
           return(uint(itemInfo[tokenID].itemState));
    
      
  }

   function itemForSale(bytes32 _tokenId, uint256 _price) public {
        require(
            ownerOf(uint(_tokenId)) == msg.sender,
            "You can't sale the item you don't owned"
        );
       
        itemInfo[(_tokenId)].price = _price; 
    }

    function purchasedByManufacturer(address from , address to,  bytes32 _tokenId)  public arrayproof(msg.sender, block.timestamp) {
(itemInfo[_tokenId].price > 0, "The item should be up for sale");
            safeTransferFrom(from,to,uint(_tokenId));
            emit _purchasedByManufacturer(_tokenId,block.timestamp);
    }

    function shippedBySupplier(bytes32 _tokenId) public { 
        itemInfo[(_tokenId)].itemState=State.shippedBySupplier;
    }
    
    function packagedByManufacturer(uint weight, uint flavor, uint qty, uint productType) public returns (uint){
            tokenID= sha256(abi.encodePacked(weight, flavor, qty, productType));
          Nugget memory newNugget = Nugget(uint(tokenID),msg.sender,State.packagedByManufacturer);
        
          _mint(msg.sender,uint(tokenID));
           emit lognewNugget(tokenID,block.timestamp);
           return(uint(nuggetInfo[tokenID].NuggetState));
    }

    function validate (address sender, address receiver,uint date,  uint txn) public view returns(bool valid){
      bytes32 hash_new= (sha256(abi.encodePacked(sender, receiver, date)));
      if(array_proof[txn]==hash_new){
          return(true);
      }

   
   
    }}