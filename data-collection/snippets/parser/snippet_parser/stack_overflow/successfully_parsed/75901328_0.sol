
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";


contract AliveNatureMarketplaceV1 is Ownable, Pausable,  ReentrancyGuard  {
    IERC20 public ERC20;
    IERC721 public ERCNFT;

    using Counters for Counters.Counter;
    
    Counters.Counter private numOfListing;

    uint256  commissionPercentage = 250;

struct NFTListing {  
  ERC721 nft;
  uint tokenId;
  uint price;
  address coin;
  address seller;
  bool forSale;
}
  
  event NftBuy(address _buyer, uint256 _tokenId, uint256 _price);
  event NftList(address _seller, IERC721 _nft, uint256 _tokenId);
 
  mapping(uint256 => NFTListing) public listings;
   
   modifier onlyNftOwner(uint _Id) {
        require(msg.sender == listings[_Id].seller);
        _;
    }


    function pauseMarketplace() public onlyOwner {
        _pause();
    }

    function unpauseMarketplace() public onlyOwner {
        _unpause();
    }

  

  function listNFT(ERC721 _nft, uint256 _tokenId, uint256 _price, address _coin) public  {
    ERCNFT = IERC721(_nft);
    require (ERCNFT.ownerOf(_tokenId) == msg.sender, "You are not the owner");
    require(_price > 0, "NFTMarket: price must be greater than 0");
    numOfListing.increment();
    listings[numOfListing.current()] = NFTListing(
       _nft,
       _tokenId,
       _price,
       _coin,
       payable(msg.sender), 
       false
       );
    NFTListing storage listing = listings[_tokenId];
   
  
    ERCNFT.transferFrom( msg.sender, address(this), _tokenId);
    listing.forSale = true;
     emit NftList(msg.sender, ERCNFT, _tokenId);

  } 





  function cancel(uint _Id) public payable onlyNftOwner(_Id){
     NFTListing storage listing = listings[_Id];
     require(listing.seller == msg.sender);
     require(listing.forSale == true);
     listing.nft.transferFrom(address(this), msg.sender, _Id);
     listing.forSale = false;
  }




  function buyNFT(uint _Id) public payable whenNotPaused nonReentrant {
        NFTListing storage listing = listings[_Id];
        require(_Id > 0 && _Id <= numOfListing.current(), "item doesn't exist");
        require(msg.value >= listing.price,"not enough balance for this transaction");
        require(listing.forSale != false, "item is not for sell");
        require(listing.seller != msg.sender, "You cannot buy your own nft");

        uint256 comissionAmount = SafeMath.mul(listing.price, commissionPercentage);
        comissionAmount = SafeMath.div(comissionAmount, 10000);
        uint256 sellerAmount = SafeMath.sub(listing.price, comissionAmount);


        if (listing.coin == 0xF194afDf50B03e69Bd7D057c1Aa9e10c9954E4C9){
        require(sellerAmount <= address(this).balance, "Insufficient funds.");
        payable(address(this)).transfer(comissionAmount);
        payable(listing.seller).transfer(sellerAmount);
        } else {
          ERC20 = IERC20(listing.coin);
          require(sellerAmount <= ERC20.balanceOf(address(this)), "Insufficient funds.");
          ERC20.transfer(address(this), comissionAmount);
          ERC20.transfer(listing.seller, sellerAmount);

        }
        listing.nft.transferFrom(address(this), msg.sender, listing.tokenId);
        listing.seller = msg.sender;
        listing.forSale = false;
        emit NftBuy( msg.sender, listing.tokenId, sellerAmount);
    }

     
    function transferOrWithdraw (bool _isCelo, uint _amount, address _ERC20Address) public whenNotPaused nonReentrant onlyOwner {
        require(_amount != 0, "Amount cannot be zero");
       if (_isCelo) {
            require(_amount <= address(this).balance, "Insufficient funds.");
            payable(msg.sender).transfer(_amount);
        } else {
            require(_ERC20Address != address(0), "ERC20 address cannot be zero address");
            ERC20 = IERC20(_ERC20Address);
            require(_amount <= ERC20.balanceOf(address(this)), "Insufficient funds.");
            ERC20.transfer(msg.sender , _amount);
        }
    }


    function getNFTListing(uint _Id) public view returns (NFTListing memory) {
        return listings[_Id];
    }

    
    
    function getListinglength() public view returns (uint) {
        return numOfListing.current();
    }   


  

}
