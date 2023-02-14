
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SALES is Ownable {
  using SafeMath for uint256;
  
  IERC20 token;

  uint256 private rate = 3000; 
  uint256 private start = 1636914760; 
  uint256 private dayMax = 45; 
  uint256 private buyMax = 5; 
  
  uint256 public initialTokens; 
  bool public initialized = false;
  uint256 public raisedAmount = 0;

  mapping(address => uint256) investorBalances;

  
  event BoughtTokens(address indexed to, uint256 value);

  constructor(address _token){
    setAddrERC20(_token);
  }

  
  receive() external payable {
    buyTokens();
  }

   
  function buyTokens() public payable whenSaleIsActive {
    uint256 weiAmount = msg.value; 
    uint256 tokens = weiAmount.mul(rate);
    uint256 amountMax = investorBalances[msg.sender].add(weiAmount);

    if(amountMax >= buyMax){
      revert("You have reached the purchase limit");
    }

    emit BoughtTokens(msg.sender, tokens); 
    raisedAmount = raisedAmount.add(msg.value); 
    token.transfer(msg.sender, tokens); 
    
    investorBalances[msg.sender] = amountMax;

    payable(owner()).transfer(msg.value);
  }

  
  modifier whenSaleIsActive() {
    
    assert(isActive());
    _;
  }

  function isActive() public view returns (bool) {
    return (
        initialized == true &&
        block.timestamp >= start && 
        block.timestamp <= start.add(dayMax * 1 days)
    );
  }

  
  function terminateSales() public onlyOwner  {
    
    uint256 balance = token.balanceOf(address(this));
    assert(balance > 0);
    token.transfer(owner(), balance);    
  }

  
  function tokensAvailable() public view returns (uint256) {
    return token.balanceOf(address(this));
  }

  
  function investorBalanceAvailable(address _investor) public view returns (uint256) {
    return investorBalances[_investor];
  }

  
  function initialize() public onlyOwner {
      require(initialized == false); 
      initialized = true;
  }

  function setRate(uint _rate) public onlyOwner{
    rate = _rate;
  }

  function setBuyMax(uint _buyMax) public onlyOwner{
    buyMax = _buyMax;
  }

  function setStart(uint _start) public onlyOwner{
    start = _start;
  }

  function setDays(uint _days) public onlyOwner{
    dayMax = _days;
  }

  function setAddrERC20(address _tokenAddr) public onlyOwner{
    require(_tokenAddr != address(0));
    token = IERC20(_tokenAddr);
  }
}
