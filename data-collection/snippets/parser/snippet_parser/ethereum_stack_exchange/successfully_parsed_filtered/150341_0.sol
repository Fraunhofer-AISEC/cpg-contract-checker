


pragma solidity ^0.8.4;




interface IERC20 {
    
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    event Approval(address indexed owner, address indexed spender, uint256 value);

    
    function totalSupply() external view returns (uint256);

    
    function balanceOf(address account) external view returns (uint256);

    
    function transfer(address to, uint256 amount) external returns (bool);

    
    function allowance(address owner, address spender) external view returns (uint256);

    
    function approve(address spender, uint256 amount) external returns (bool);

    
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract P2PDEX {
    struct Listing {
        address payable user;
        address tokenToTransfer;
        uint256 amountToTransfer;
        address tokenDesired;
        uint256 amountDesired;
    }

    uint256 public transactionFee; 
    mapping(address => uint256) public tokenFees; 
    address public owner; 

    Listing[] public listings;
    
    mapping(address => uint256) private allowed;

    event NewListing(uint256 indexed listingId, address indexed user, address indexed tokenToTransfer, uint256 amountToTransfer, address tokenDesired, uint256 amountDesired);
event TradeComplete(uint256 indexed listingId, address indexed buyer, uint256 amountSold, address indexed seller, uint256 amountBought);

constructor() {
    transactionFee = 100; 
    owner = msg.sender; 
}

modifier onlyOwner() {
    require(msg.sender == owner, "Only the owner can call this function");
    _;
}

function createListing(address _tokenToTransfer, uint256 _amountToTransfer, address _tokenDesired, uint256 _amountDesired) public {
    Listing memory newListing = Listing({
        user: payable(msg.sender),
        tokenToTransfer: _tokenToTransfer,
        amountToTransfer: _amountToTransfer,
        tokenDesired: _tokenDesired,
        amountDesired: _amountDesired
    });

    listings.push(newListing);

    emit NewListing(listings.length - 1, msg.sender, _tokenToTransfer, _amountToTransfer, _tokenDesired, _amountDesired);
}

function trade(uint256 _listingId) public {
    Listing storage listing = listings[_listingId];

    uint256 feeAmountToTransfer = (listing.amountToTransfer * transactionFee) / 10000; 
    uint256 feeAmountDesired = (listing.amountDesired * transactionFee) / 10000; 

    uint256 totalAmountToTransfer = listing.amountToTransfer - feeAmountToTransfer; 
    uint256 totalAmountDesired = listing.amountDesired - feeAmountDesired; 

    require(IERC20(listing.tokenToTransfer).transferFrom(listing.user, address(this), listing.amountToTransfer), "Token transfer failed");
    require(IERC20(listing.tokenDesired).transferFrom(msg.sender, address(this), listing.amountDesired), "Token transfer failed");

    
    require(IERC20(listing.tokenToTransfer).transferFrom(listing.user, owner, feeAmountToTransfer), "Token transfer failed");
    require(IERC20(listing.tokenDesired).transferFrom(msg.sender, owner, feeAmountDesired), "Token transfer failed");

    
    require(IERC20(listing.tokenToTransfer).transfer(msg.sender, totalAmountToTransfer), "Token transfer failed");
    require(IERC20(listing.tokenDesired).transfer(listing.user, totalAmountDesired), "Token transfer failed");

    delete listings[_listingId];

    emit TradeComplete(_listingId, msg.sender, totalAmountToTransfer, listing.user, totalAmountDesired);
}

function getListingCount() public view returns (uint256) {
    return listings.length;
}

function setTransactionFee(uint256 _transactionFee) external onlyOwner {
    require(_transactionFee <= 10000, "Invalid fee"); 
    transactionFee = _transactionFee;
}

function setTokenApproval(address _token, uint256 _amount) external {
    require(_amount > 0, "Invalid approval amount");
    IERC20(_token).approve(address(this), _amount);
}
}
