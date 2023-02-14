
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract SALES is Ownable {
  using SafeMath for uint256;
  
  IERC20 token;

  uint256 private rate; 
  uint256 private price = 0.08 * 10 ** 18; 
  uint256 private start = 1636914760; 
  uint256 private dayMax = 50; 
  uint256 private buyMax = 5 ether; 
  uint256 private feesCashBack = 0.01 * 10 ** 18; 
  uint256 private valueMinCashBack = 0.5 ether; 
  
  uint256 public initialTokens; 
  bool public initialized = false;
  bool public hasCashBack = true;
  uint256 public raisedAmount = 0;

  address private sigAddres;
  mapping(address => uint256) investorBalances;

  
  event BoughtTokens(address indexed to, uint256 value);

  constructor(address _token, address _sigAddress){
    setAddrERC20(_token);
    setSig(_sigAddress);
  }

  
  receive() external payable {
    payable(owner()).transfer(msg.value);
  }

   
  function buyTokens(uint256 _ethPrice, address _addressBack, bytes memory _signature) public payable whenSaleIsActive isValidPrice(_ethPrice, _addressBack, _signature) {    
    uint256 weiAmount = msg.value; 
    uint256 tokens = weiAmount.mul(rate);
    uint256 investorWei = investorBalances[msg.sender].add(msg.value);

    if(investorWei > buyMax){
      revert("You have reached the purchase limit");
    }

    if(hasCashBack && _addressBack != address(0) && msg.value >= valueMinCashBack){
      uint256 tokenBack = tokens.mul(feesCashBack);
      token.transfer(_addressBack, tokenBack);
    }

    emit BoughtTokens(msg.sender, tokens); 
    raisedAmount = raisedAmount.add(msg.value); 
    token.transfer(msg.sender, tokens); 
    
    investorBalances[msg.sender] = investorWei;

    payable(owner()).transfer(msg.value);
  }

  
  modifier whenSaleIsActive() {
    
    assert(isActive());
    _;
  }

  modifier isValidPrice(uint256 _ethPrice, address _addressBack, bytes memory _signature) {
    bytes32 message = keccak256(abi.encodePacked(_ethPrice, _addressBack));
    assert(ECDSA.recover(message, _signature) == sigAddres);

    rate = _ethPrice.div(price);
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
    return buyMax.sub(investorBalances[_investor]);
  }

  
  function initialize() public onlyOwner {
      require(initialized == false); 
      initialized = true;
  }

  
  function startCashBack(bool _hasCashBack) public onlyOwner {      
      hasCashBack = _hasCashBack;
  }

  function setFeesCashBack(uint256 _feesCashBack) public onlyOwner {      
      feesCashBack = _feesCashBack;
  }

  function setValueMinCashBack(uint256 _valueMinCashBack) public onlyOwner {      
      valueMinCashBack = _valueMinCashBack;
  }

  function setPrice(uint _price) public onlyOwner{
    price = _price;
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

  function setSig(address _sig) internal{
    sigAddres = _sig;
  }

  function setAddrERC20(address _tokenAddr) public onlyOwner{
    require(_tokenAddr != address(0));
    token = IERC20(_tokenAddr);
  }
}
