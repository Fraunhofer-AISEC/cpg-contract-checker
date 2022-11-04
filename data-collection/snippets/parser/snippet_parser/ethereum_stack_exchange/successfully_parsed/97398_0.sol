contract MyContract {
    IERC20 internal constant ETH_TOKEN_ADDRESS = IERC20(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);
    IKyberNetworkProxy kyberProxy;
    address payable public platformWallet;
    uint256 public platformFeeBps;

    
    
    
    constructor(
        IKyberNetworkProxy _kyberProxy,
        address payable _platformWallet,
        uint256 _platformFeeBps
        ) public
    {
        kyberProxy = _kyberProxy;
        platformWallet = _platformWallet;
        platformFeeBps = _platformFeeBps;
    }

    
    function getConversionRates(
        IERC20 srcToken,
        IERC20 destToken,
        uint256 srcQty
    ) public
      view
      returns (uint256)
    {
      return kyberProxy.getExpectedRateAfterFee(srcToken, destToken, srcQty, platformFeeBps, '');
    }

    
    function executeSwap(
        IERC20 srcToken,
        uint256 srcQty,
        IERC20 destToken,
        address payable destAddress,
        uint256 maxDestAmount
    ) external payable {
        if (srcToken != ETH_TOKEN_ADDRESS) {
            
            
            
            require(srcToken.transferFrom(msg.sender, address(this), srcQty), "transferFrom failed");

            
            
            require(srcToken.approve(address(kyberProxy), 0), "approval to 0 failed");

            
            require(srcToken.approve(address(kyberProxy), srcQty), "approval to srcQty failed");
        }

        
        uint256 minConversionRate = kyberProxy.getExpectedRateAfterFee(
            srcToken,
            destToken,
            srcQty,
            platformFeeBps,
            '' 
        );

        
        kyberProxy.tradeWithHintAndFee{value: msg.value}(
            srcToken,
            srcQty,
            destToken,
            destAddress,
            maxDestAmount,
            minConversionRate,
            platformWallet,
            platformFeeBps,
            '' 
        );
    }
}
