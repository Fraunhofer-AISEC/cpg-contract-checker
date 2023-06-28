interface Token {
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function transferFrom(address, address, uint256) external;
}

contract KM {
    event Start(uint256 auctionNumber);
    event Bid(address indexed sender, uint256 amount);
    event End(address[] bidderList);
    Token public tokenToBeAttributed;
    uint256 public endAt;
    bool public started;
    bool public ended;
    string tokenID;
    address[] bidderList;
    address corporateAddress;
    mapping(address => uint256) public bids;
    uint256 public totalBiddedAmount;
    uint256 public auctionNumber;

    constructor(    
        address _tokenToBeAttributed,
        string memory _tokenID,
        address _coporateAddress
    ) {
        tokenToBeAttributed = Token(_tokenToBeAttributed);
        tokenID = _tokenID;
        corporateAddress = _coporateAddress;
    }
}