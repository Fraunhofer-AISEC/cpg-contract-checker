
contract TESTPresale is ReentrancyGuard {
    using SafeMath for uint256;
    using SafeBEP20 for IBEP20;
    
    mapping(address => uint256) public tokensOwned;
    
    mapping(address => uint256) public tokensUnclaimed;

    
    IBEP20 public TEST;
    
    IBEP20 public USDC;

    
    bool isSaleActive;
    
    bool isClaimActive;
    
    uint256 totalTokensSold = 0;
    
    
    uint256 public testPerUsdc = 1e18/uint256(950000);
    
    uint256 usdcReceived = 0;

    uint256 HardCap = 85000 * 10 ** 18; 

    event TokenBuy(address user, uint256 tokens);
    event TokenClaim(address user, uint256 tokens);

    constructor(
        address _TEST,
        address _USDC
    ) public {
        TEST = IBEP20(_TEST);
        USDC = IBEP20(_USDC);
    }

    function setTestPerUsdc(uint256 _testPerUsdc) public onlyOwner{
        testPerUsdc = _testPerUsdc;
    }

    function buy(uint256 _amount) public nonReentrant {
        require(isSaleActive, "Presale has not started");
        
        
        address _buyer = msg.sender;
        uint256 tokens = _amount.mul(testPerUsdc);
        require ( totalTokensSold + tokens <= HardCap, "presale hardcap reached");

        USDC.safeTransferFrom(msg.sender, address(this), _amount);

        tokensOwned[_buyer] = tokensOwned[_buyer].add(tokens);
        tokensUnclaimed[_buyer] = tokensUnclaimed[_buyer].add(tokens);
        totalTokensSold = totalTokensSold.add(tokens);

        usdcReceived = usdcReceived.add(_amount);
        emit TokenBuy(msg.sender, tokens);
    }


    function getTotalTokensSold() public view returns (uint256) {
        return totalTokensSold;
    }


    function getTESTTokensLeft() external view returns (uint256) {
        return TEST.balanceOf(address(this));
    }


    .........
    
}
