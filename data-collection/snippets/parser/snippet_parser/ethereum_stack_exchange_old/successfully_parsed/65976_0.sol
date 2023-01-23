    pragma solidity >=0.4.21 <0.6.0;

    import "./AucSters.sol";
    import "../libraries/SafeMath.sol";

    contract BiddingContract {

    using SafeMath for uint; 

    address admin;
    AucSters public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    
    struct Seller {
        uint256 sellerId;
        string sellerName;
        bool isValidSeller;
    }
    struct Bidder {
        address bidders_address;
        uint productId;
        uint bidValue;
    }
    struct Product {
        uint productId;
        uint bidStartPrice;
        uint32 bidStartTime;
        Bidder latestBid;
        string productName;
        bool isAvailable;
        uint32 bidSession;

    }

    mapping(address => Seller) registeredSeller;
    mapping(uint => address) public productIdToOwner;
    mapping(address => uint) public productCount;
    mapping(uint => Product) product;
    mapping(address => mapping(uint => uint)) public latestBidStore;

    
    address[] public regSellers;
    Product[] public productsForSale;
    address[] public bidders;


    constructor(AucSters _tokenContract, uint _tokenPrice) public {
        
        admin = msg.sender;

        
        tokenContract = _tokenContract;

        
        tokenPrice = _tokenPrice;
   }


}
