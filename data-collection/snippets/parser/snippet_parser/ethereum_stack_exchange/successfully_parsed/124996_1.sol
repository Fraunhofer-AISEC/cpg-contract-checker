import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/security/ReentrancyGuard.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/IERC1155Receiver.sol";

contract NFTMarketplace1155 is ReentrancyGuard {
    using Counters for Counters.Counter;
    Counters.Counter private _itemIds;
    Counters.Counter private _itemsSold;
    
     address public owner;
     
     constructor() {
         owner = msg.sender;
     }
     
     struct MarketItem {
         uint itemId;
         address nftContract;
         uint256 tokenId;
         address payable seller;
         address payable owner;
         uint256 price;
         bool sold;
     }
     
     mapping(uint256 => MarketItem) private idToMarketItem;
     
     event MarketItemCreated (
        uint indexed itemId,
        address indexed nftContract,
        uint256 indexed tokenId,
        address seller,
        address owner,
        uint256 price,
        bool sold
     );
     
     event MarketItemSold (
         uint indexed itemId,
         address owner
         );
     
    function createMarketItem(
        address nftContract,
        uint256 tokenId,
        uint256 price,
        uint256 amount,
        bytes memory data
        ) public payable nonReentrant {
            require(price > 0, "Price must be greater than 0");
            
            _itemIds.increment();
            uint256 itemId = _itemIds.current();
  
            idToMarketItem[itemId] =  MarketItem(
                itemId,
                nftContract,
                tokenId,
                payable(msg.sender),
                payable(address(0)),
                price,
                false
            );
            
            IERC1155(nftContract).safeTransferFrom(msg.sender, address(this), tokenId, amount, data);
                
            emit MarketItemCreated(
                itemId,
                nftContract,
                tokenId,
                msg.sender,
                address(0),
                price,
                false
            );
        }
        
    function createMarketSale(
        address nftContract,
        uint256 itemId,
        uint256 amount,
        bytes memory data
        ) public payable nonReentrant {
            uint price = idToMarketItem[itemId].price;
            uint tokenId = idToMarketItem[itemId].tokenId;
            bool sold = idToMarketItem[itemId].sold;
            require(msg.value == price, "Please submit the asking price in order to complete the purchase");
            require(sold != true, "This Sale has alredy finnished");
            emit MarketItemSold(
                itemId,
                msg.sender
                );

            idToMarketItem[itemId].seller.transfer(msg.value);
            IERC1155(nftContract).safeTransferFrom(msg.sender, address(this), tokenId, amount, data);
            idToMarketItem[itemId].owner = payable(msg.sender);
            _itemsSold.increment();
            idToMarketItem[itemId].sold = true;
        }
        
    function fetchMarketItems() public view returns (MarketItem[] memory) {
        uint itemCount = _itemIds.current();
        uint unsoldItemCount = _itemIds.current() - _itemsSold.current();
        uint currentIndex = 0;

        MarketItem[] memory items = new MarketItem[](unsoldItemCount);
        for (uint i = 0; i < itemCount; i++) {
            if (idToMarketItem[i + 1].owner == address(0)) {
                uint currentId = i + 1;
                MarketItem storage currentItem = idToMarketItem[currentId];
                items[currentIndex] = currentItem;
                currentIndex += 1;
            }
        }
        return items;
    }

    function onERC1155Received(address, address, uint256, uint256, bytes memory) public virtual returns (bytes4) {
        return this.onERC1155Received.selector;
    }

    function onERC1155BatchReceived(address, address, uint256[] memory, uint256[] memory, bytes memory) public virtual returns (bytes4) {
        return this.onERC1155BatchReceived.selector;
    }

    function onERC721Received(address, address, uint256, bytes memory) public virtual returns (bytes4) {
        return this.onERC721Received.selector;
    }
      
}
