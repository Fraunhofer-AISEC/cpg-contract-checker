contract MyContract is Owned {
  event Created (
    uint256 tradeId,
    uint256 createdAt,
    uint256 expiredAt,
    address originatorAddress,
    address benificiaryAddress,
    string expectedToken,
    uint256 receivedQty);
  event Released(uint256 tradeId);

  struct Escrow {
    uint256 tradeId;
    uint256 createdAt;
    uint256 expiredAt;
    address originatorAddress;
    address benificiaryAddress;
    string expectedToken;
    uint256 receivedQty;
  }

  mapping (uint256 => Escrow) public escrows;
  mapping(address => mapping(address => uint256)) public escrowBalance;
  uint256 feePercent;
  address feeAddress;
  
  
  
  constructor() public {
  
  
  }

  function createEscrow( uint256 _tradeId,
    uint256 _expiredAt,
    address _benificiaryAddress,
    string _expectedToken,
    uint256 _receivedQty, 
    address token)payable external
  {   
    uint256 tokenBalance = ERC20Interface(token).balanceOf(msg.sender);
    require(tokenBalance >=_receivedQty, "Insufficient balance.");

    escrows[_tradeId] = Escrow(_tradeId, now, now + _expiredAt, msg.sender, _benificiaryAddress, _expectedToken, _receivedQty);

    ERC20Interface(token).transferFrom(msg.sender, this, _receivedQty);   
    emit Created (_tradeId, now, now + _expiredAt, msg.sender, _benificiaryAddress, _expectedToken, _receivedQty);
  }

  function releaseToken(uint256 _tradeId, address token) external {
    Escrow storage escrow = escrows[_tradeId];
    ERC20Interface(token).transfer(escrow.benificiaryAddress, escrow.receivedQty);
    emit Released(_tradeId);
    delete escrows[_tradeId];
  }   
}
