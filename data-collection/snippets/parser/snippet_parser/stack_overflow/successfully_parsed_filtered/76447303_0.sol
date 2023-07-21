contract FractionalRealEstate {
    struct Asset {
        address owner;
        string description;
        uint256 totalShares;
        uint256 pricePerShare;
    }
    
    struct Order {
        address orderOwner;
        uint256 assetId;
        uint256 shareCount;
    }
    
    mapping(uint256 => Asset) public assets;
    mapping(uint256 => Order[]) public buyOrders;
    mapping(uint256 => Order[]) public sellOrders;
    uint256 public assetCount;

    ERC20 public token;
    address public owner;
    AggregatorV3Interface internal priceFeed; 
    

    constructor(address _tokenAddress, address _priceFeed) {
        token = ERC20(_tokenAddress);
        owner = msg.sender;
        priceFeed = AggregatorV3Interface(_priceFeed);
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function.");
        _;
    }
    
    function registerAsset(string description, uint256 price, uint256 shares) external onlyOwner {
        require(shares > 0, "Shares must be greater than 0.");
        assetCount++;
        assets[assetCount] = Asset(msg.sender, description, price, shares);
        
        emit RegisterAsset(description, price, shares);
    }
}