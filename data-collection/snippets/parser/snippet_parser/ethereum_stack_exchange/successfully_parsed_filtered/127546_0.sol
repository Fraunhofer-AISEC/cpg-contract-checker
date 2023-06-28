contract Arbitrage is Ownable {
  uint constant deadline = 10 days;
  address public myOwner;
  address public pcsFactory;
  address public acsiVault;
  bytes32 public acsiPool;


  constructor() {
    myOwner = msg.sender;
  }

  function startArbitrage(
    address inputToken, 
    address outputToken, 
    uint inputTokenAmount, 
    address _pcsFactory,
    address _acsiVault,
    bytes32 _acsiPool
  ) external onlyOwner {
    pcsFactory = _pcsFactory;
    acsiVault = _acsiVault;
    acsiPool = _acsiPool;
    address pairAddress = IPancakeFactory(pcsFactory).getPair(inputToken, outputToken);

    require(pairAddress != address(0), 'This pool does not exist');

    IPancakePair(pairAddress).swap(
      inputTokenAmount, 
      0, 
      address(this), 
      bytes('nothing')
    );
  }

  function pancakeCall(
    address _sender, 
    uint _amount0, 
    uint _amount1, 
    bytes calldata _data
  ) external {
    address[] memory path = new address[](2);
    uint amountToken = _amount0 == 0 ? _amount1 : _amount0;
    
    address token0 = IPancakePair(msg.sender).token0();
    address token1 = IPancakePair(msg.sender).token1();
  
    

    require(_amount0 == 0 || _amount1 == 0, 'one amount needs to be 0');

    path[0] = _amount0 == 0 ? token1 : token0;
    path[1] = _amount0 == 0 ? token0 : token1;

    IERC20 token = IERC20(_amount0 == 0 ? token1 : token0);

    token.approve(address(acsiVault), amountToken);

    uint amountRequired = PancakeLibrary.getAmountsIn(
      pcsFactory, 
      amountToken, 
      path
    )[0];

    IVault.SingleSwap memory swap = IVault.SingleSwap({
      poolId: acsiPool,
      kind: IVault.SwapKind.GIVEN_IN,
      assetIn: IAsset(path[1]),
      assetOut: IAsset(path[0]),
      amount: amountToken,
      userData: '0x'
    });

    IVault.FundManagement memory fmgmt = IVault.FundManagement({
      sender: address(this),
      fromInternalBalance: false,
      recipient: payable(address(this)),
      toInternalBalance: false
    });

    uint amountReceived = IVault(acsiVault).swap(
      swap,
      fmgmt,
      amountRequired,
      deadline
    );

    require(amountReceived > amountRequired, string(abi.encodePacked('Amount received is less than required Received:', amountReceived, ' required: ', amountRequired)));

    IERC20 otherToken = IERC20(_amount0 == 0 ? token0 : token1);
    otherToken.transfer(msg.sender, amountRequired);
    otherToken.transfer(myOwner, amountReceived - amountRequired);
  }
}
