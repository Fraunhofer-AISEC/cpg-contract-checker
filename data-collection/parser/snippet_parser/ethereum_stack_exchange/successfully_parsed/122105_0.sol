interface IWETH9 {

    function deposit() external payable ;
    function withdraw(uint wad) external payable;
    function totalSupply() external returns (uint);  
    function approve(address guy, uint wad) external returns (bool);

}
      function stake() external payable {
    contractBalance=IERC20(WETH).balanceOf(address(this));
 

    uint256 amt = 1 * 1e18;

    IWETH9(WETH).deposit{value: address(this).balance}();

    balances[address(this)] = contractBalance;

    contractBalance=IERC20(WETH).balanceOf(address(this));

  }
  function getValue() external payable {
    
    contractBalance=IERC20(WETH).balanceOf(address(this));
    uint amt = 1 * 1e18;

    bool torf = IWETH9(WETH).approve(address(this), amt);
    
    IWETH9(WETH).withdraw(amt);

    balances[address(this)] = contractBalance;

  }
