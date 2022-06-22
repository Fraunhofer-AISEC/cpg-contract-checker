uint256 private privatePrice = 20;
uint256 public totalCollected;
uint256 public previousCollected = 0;
uint256 public walletLimit = 4*10**(18);
uint256 public softCap = 5*10**(18);
uint256 public hardCap;
uint256 public txCount;
bool public privateOpen;
uint256 private txCollected;
mapping(address => presaleWallet) inPresale;

struct presaleWallet {
    bool isWhiteListed;
    uint256 amount;
    uint256 txCount;
    uint256 tokenAmount;
    uint256 newAmount;
    bool tgeCollect;
    uint256 numOfCollectTX;
    uint256 nextCollect;
}

IERC20 private immutable _depositToken = IERC20(0xeD24FC36d5Ee211Ea25A80239Fb8C4Cfd80f12Ee);

 function privateRound() public payable {
    require(privateOpen == true,"PrivateRound: Private Round is Closed");
    txCollected = depositToken().balanceOf(address(this)) - previousCollected;
    previousCollected = depositToken().balanceOf(address(this));

    require(txCollected > 0,"PrivateRound: You sent 0 BUSD");
    require(inPresale[msg.sender].amount + txCollected <= walletLimit, "PrivateRound: Wallet limit has been reached");

    totalCollected += txCollected;
    txCount ++;
    inPresale[msg.sender].isWhiteListed = true;
    inPresale[msg.sender].amount += txCollected;
    inPresale[msg.sender].txCount ++;
    inPresale[msg.sender].tokenAmount += (txCollected*10**2)/privatePrice;

    emit DepositSuccesful(msg.sender, txCollected, inPresale[msg.sender].amount);
}
