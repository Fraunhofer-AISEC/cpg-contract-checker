


pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Market is ReentrancyGuard, Ownable {
  struct TokenInfo{
    IERC20 paytoken;
    uint256 listingFee;
    uint256 mintingFee;
    uint256 price;
  }

  using Counters for Counters.Counter;
  Counters.Counter private _itemIds;
  Counters.Counter private _itemsSold;
  IERC20 public paytoken;


  TokenInfo[] public AllowedCrypto;

  address payable holder;
  
  

  constructor() {
    holder = payable(msg.sender);
  }

  

  struct VaultItem {
    uint itemId;
    address nftContract;
    uint256 tokenId;
    address payable seller;
    address payable holder;
    uint256 price;
    bool sold;
  }

  mapping(uint256 => VaultItem) private idToVaultItem;

  event VaultItemCreated (
    uint indexed itemId,
    address indexed nftContract,
    uint256 indexed tokenId,
    address seller,
    address holder,
    uint256 price,
    bool sold
  );

  function AddCurrency (IERC20 _paytoken,uint256 _listingFee,uint256 _mintingFee,uint256 _price) public onlyOwner {
        AllowedCrypto.push(TokenInfo({
            paytoken:_paytoken,
            listingFee:_listingFee,
            mintingFee: _mintingFee,
            price:_price
        }));
    }
  
  function approveCRI (uint256 _pid) public payable nonReentrant{
    TokenInfo storage tokens = AllowedCrypto[_pid];
    paytoken = tokens.paytoken;
    uint256 amount = 200000000000000000000000000;
    paytoken.approve(msg.sender, amount);
  }

  function allowenceCRI (uint256 _pid) public  payable nonReentrant{
    TokenInfo storage tokens = AllowedCrypto[_pid];
    paytoken = tokens.paytoken;
    paytoken.allowance(address(this), msg.sender);
  }

  function getListingFee(uint256 _pid) public view returns (uint256) {
    TokenInfo storage tokens = AllowedCrypto[_pid];
    uint256 listingFee;
    listingFee = tokens.listingFee;
    return listingFee;
  }
  
  function createVaultItem(address nftContract,uint256 tokenId,uint256 _pid) public payable nonReentrant {
    TokenInfo storage tokens = AllowedCrypto[_pid];
    paytoken = tokens.paytoken;
    uint256 listingFee;
    listingFee = tokens.listingFee;
    uint256 price;
    price = tokens.price;
    require(price > 0, "Price cannot be zero");
    require(msg.value == listingFee, "Price cannot be listing fee");
    _itemIds.increment();
    uint256 itemId = _itemIds.current();
    idToVaultItem[itemId] =  VaultItem(itemId,nftContract,tokenId,payable(msg.sender),payable(address(0)),price,false);
    IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);
    emit VaultItemCreated(itemId,nftContract,tokenId,msg.sender,address(0),price,false);
    }

  function n2DMarketSale(address nftContract,uint256 itemId,uint256 _pid) public payable nonReentrant {
    TokenInfo storage tokens = AllowedCrypto[_pid];
    paytoken = tokens.paytoken;
    uint256 listingFee;
    listingFee = tokens.listingFee;
    uint price = tokens.price; 
    uint tokenId = idToVaultItem[itemId].tokenId;
    paytoken.approve(msg.sender, price);
    require(msg.value == paytoken.balanceOf(address(this)), "Not enough balance to complete transaction");
    idToVaultItem[itemId].seller.transfer(msg.value);
    IERC721(nftContract).transferFrom(address(this), msg.sender, tokenId);
    idToVaultItem[itemId].holder = payable(msg.sender);
    idToVaultItem[itemId].sold = true;
    _itemsSold.increment();
    payable(holder).transfer(listingFee);
  }

  function getAvailableNft() public view returns (VaultItem[] memory) {
    uint itemCount = _itemIds.current();
    uint unsoldItemCount = _itemIds.current() - _itemsSold.current();
    uint currentIndex = 0;

    VaultItem[] memory items = new VaultItem[](unsoldItemCount);
    for (uint i = 0; i < itemCount; i++) {
      if (idToVaultItem[i + 1].holder == address(0)) {
        uint currentId = i + 1;
        VaultItem storage currentItem = idToVaultItem[currentId];
        items[currentIndex] = currentItem;
        currentIndex += 1;
      }
    }
    return items;
  }

  function getMyNft() public view returns (VaultItem[] memory) {
    uint totalItemCount = _itemIds.current();
    uint itemCount = 0;
    uint currentIndex = 0;

    for (uint i = 0; i < totalItemCount; i++) {
      if (idToVaultItem[i + 1].holder == msg.sender) {
        itemCount += 1;
      }
    }

    VaultItem[] memory items = new VaultItem[](itemCount);
    for (uint i = 0; i < totalItemCount; i++) {
      if (idToVaultItem[i + 1].holder == msg.sender) {
        uint currentId = i + 1;
        VaultItem storage currentItem = idToVaultItem[currentId];
        items[currentIndex] = currentItem;
        currentIndex += 1;
      }
    }
    return items;
  }

  function getMyMarketNfts() public view returns (VaultItem[] memory) {
    uint totalItemCount = _itemIds.current();
    uint itemCount = 0;
    uint currentIndex = 0;

    for (uint i = 0; i < totalItemCount; i++) {
      if (idToVaultItem[i + 1].seller == msg.sender) {
        itemCount += 1;
      }
    }

    VaultItem[] memory items = new VaultItem[](itemCount);
    for (uint i = 0; i < totalItemCount; i++) {
      if (idToVaultItem[i + 1].seller == msg.sender) {
        uint currentId = i + 1;
        VaultItem storage currentItem = idToVaultItem[currentId];
        items[currentIndex] = currentItem;
        currentIndex += 1;
      }
    }
    return items;
  }

  function withdraw(uint256 _pid) public payable onlyOwner() {
    TokenInfo storage tokens = AllowedCrypto[_pid];
    paytoken = tokens.paytoken;
    require(msg.sender.balance == paytoken.balanceOf(address(this)));
    paytoken.transfer(msg.sender, paytoken.balanceOf(address(this)));
    }
}
