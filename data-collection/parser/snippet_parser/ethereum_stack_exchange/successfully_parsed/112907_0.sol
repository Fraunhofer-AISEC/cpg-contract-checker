contract AssetManager {
    IUniswap uniswap;
      mapping(address => uint) public lastWithdrawTime;
      mapping(address => uint) public balances;
            
    constructor(address _uniswap) {
        uniswap = IUniswap(_uniswap);
    }
            

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
    
    function withdraw(uint _amount) public {
      require(balances[msg.sender] >= _amount);
      balances[msg.sender] -= _amount;
      lastWithdrawTime[msg.sender] = block.timestamp;
    
      (bool sent, ) = msg.sender.call{value: _amount}("");
      require(sent, "Failed to send Ether");
    }
      
    function takePosition(address token, uint deadline, uint amountOutMin) external returns (uint256) {
            
            address[] memory path = new address[](2);
            path[0] = uniswap.WETH();
            path[1] = token;
            
            uint amount = balances[msg.sender];
            balances[msg.sender] -= amount;
            
            uniswap.swapExactETHForTokens{value: amount}(
                amountOutMin,
                path,
                address(this),
                deadline);
                
            return IERC20(token).balanceOf(address(this));
    }
    
    
    function getBalance() public view returns (uint) {
      return address(this).balance;
    }
      
    function getMyBalance() public view returns (uint) {
      return balances[msg.sender];
    }
}
