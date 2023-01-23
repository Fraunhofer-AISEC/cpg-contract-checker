import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

interface IWETH is IERC20 {

  function deposit() external payable;

  function withdraw(uint256 wad) external;
}

contract Swap {
  address private constant  WETH =
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
    
    IWETH(WETH).transfer(msg.sender, IWETH(WETH).balanceOf(address(this)));
  }
  
  
  receive() external payable {}
  
  
  function unwrapEther(uint256 Amount) external {
    address payable sender = payable(msg.sender);
    if (Amount != 0) {
      
      require(IWETH(WETH).allowance(msg.sender, address(this)) >= Amount, "insufficient allowance");
      IWETH(WETH).transferFrom(msg.sender, address(this), Amount);
      IWETH(WETH).withdraw(Amount);
      sender.transfer(address(this).balance);
    }
  }
}
