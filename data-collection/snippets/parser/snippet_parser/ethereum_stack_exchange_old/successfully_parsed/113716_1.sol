
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SALESTOKEN is Ownable {
  using SafeMath for uint256;
  
  IERC20 token;

  uint256 private RATE = 3000; 
  uint256 private CAP = 5350; 
  uint256 private START = 1519862400; 
  uint256 private DAYS = 45; 
  
  uint256 public initialTokens; 
  bool public initialized = false;
  uint256 public raisedAmount = 0;

  
  event BoughtTokens(address indexed to, uint256 value);

   
  function buyTokens() public payable whenSaleIsActive {
    uint256 weiAmount = msg.value; 
    uint256 tokens = weiAmount.mul(RATE);
    address owner = owner();

    emit BoughtTokens(msg.sender, tokens); 
    raisedAmount = raisedAmount.add(msg.value); 
    token.transfer(msg.sender, tokens); 
    
    owner.transfer(msg.value);
  }

  
  modifier whenSaleIsActive() {
    
    assert(isActive());
    _;
  }

  function isActive() public view returns (bool) {
    return (
        initialized == true &&
        block.timestamp >= START && 
        block.timestamp <= START.add(DAYS * 1 days) && 
        goalReached() == false 
    );
  }

  
  function goalReached() public view returns (bool) {
    return (raisedAmount >= CAP * 1 ether);
  }

  function setRate(uint _rate) public onlyOwner{
    RATE = _rate;
  }

  function setCap(uint _cap) public onlyOwner{
    CAP = _cap;
  }

  function setStart(uint _start) public onlyOwner{
    START = _start;
  }

  function setDays(uint _days) public onlyOwner{
    DAYS = _days;
  }

  function setAddrERC20(address _tokenAddr) public onlyOwner{
    require(_tokenAddr != address(0));
    token = IERC20(_tokenAddr);
  }
}
