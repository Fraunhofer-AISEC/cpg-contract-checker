contract OwnerContract{
  address owner;
  constructor(){
    owner = msg.sender;
  }
  modifier isOwner(){
    require(msg.sender == owner, "Access denied!");
    _;
  }
}


interface IERC20{
  function allowance(address owner, address spender) external view returns (uint256);
  function decimals() external view returns (uint8);
  function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract ICO_Contract is ownerContract{
  
  uint256 eachTokenPrice;
  uint256 maximumAmount;
  uint256 sellAmount;

  constructor(uint256 maximumAmount_){
    maximumAmount = maximumAmount_;
  }

  modifier maximumReached(uint256 _amount){
    require((sellAmount + _amount) <= maximumAmount, "Maximum amount of ICO reached!");
    _;
  }
  
  address USDTtokenAddress = USDT_TOKEN_ADDRESS_ON_DEPLOYED_NETWORK;

  function changeUSDTtokenAddress(address _address) public isOwner{
    USDTtokenAddress = _address;
  }
  address ICOtokenAddress = TOKEN_ADDRESS_ICO;

  function changeICOtokenAddress(address _address) public isOwner{
    ICOtokenAddress = _address;
  }

  IERC20 USDTtoken = IERC20(USDTtokenAddress);
  IERC20 ICOtoken = IERC20(ICOtokenAddress);

  function buyToken(uint256 _amount) public maximumReached(_amount){
    require(_amount > 0, "You need to spend USDT");
    uint256 approvedAmount = USDTtoken.allowance(msg.sender, address(this));
    require(approvedAmount == _amount, "Check the token allowance, not enough approved!");
    uint256 totalPrice = price * _amount * (USDtoken.decimals()/ICOtoken.decimals());
    USDTtoken.transferFrom(msg.sender, address(this), totalPrice);
    
    ICOtoken.transfer(msg.sender, _amount);
    sellAmount += _amount;
  }
  
  function showPrice() external view returns(uint256){
    return price;
  }

  function showsoldAmount() external view returns(uint256){
    return sellAmount;
  }

  function showMaxAmount() external view returns(uint256){
    return maximumAmount;
  }
}
