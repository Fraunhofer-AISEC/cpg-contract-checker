interface IWETH is IERC20 {
  receive() external payable;

  function deposit() external payable;

  function withdraw(uint256 wad) external;
}

contract Swap {
  address payable private constant  WETH =
    0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

  function wrapEther() external payable {
    uint256 ETHAmount = msg.value;

    
    if (msg.value != 0) {
      IWETH(WETH).deposit{ value: ETHAmount }();
    }
    require(
      IWETH(WETH).balanceOf(address(this)) >= ETHAmount,
      "Ethereum not deposited"
    );
  }

  function unwrapEther(uint256 Amount) external {
    address payable sender = msg.sender;

    if (Amount != 0) {
      IWETH(WETH).withdraw(Amount);
      sender.transfer(address(this).balance);
    }
  }

}
