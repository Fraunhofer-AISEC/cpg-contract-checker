contract Referral is ERC20 {
  using SafeMath for uint;
  uint8 constant MAX_REFER_DEPTH = 3;
  uint8 constant MAX_REFEREE_BONUS_LEVEL = 3;
  struct Account {
    address payable referrer;
    uint reward;
    uint referredCount;
  }
  struct RefereeBonusRate {
    uint lowerBound;
    uint rate;
  }
  event RegisteredReferer(address referee, address referrer);
  event RegisteredRefererFailed(address referee, address referrer, string reason);
  event PaidReferral(address from, address to, uint amount, uint level);
  mapping(address => Account) private accounts;
  uint256[] private levelRate;
  uint256 public referralBonus;
  uint256 private decimalsReferral;
  RefereeBonusRate[] private refereeBonusRateMap;
  constructor(
    uint _decimals,
    uint _referralBonus,
    uint256[] memory _levelRate,
    uint256[] memory _refereeBonusRateMap
  )
    public
  {
    require(_levelRate.length > 0, "Referral level should be at least one");
    require(_levelRate.length <= MAX_REFER_DEPTH, "Exceeded max referral level depth");
    require(_refereeBonusRateMap.length % 2 == 0, "Referee Bonus Rate Map should be pass as [<lower amount>, <rate>, ....]");
    require(_refereeBonusRateMap.length / 2 <= MAX_REFEREE_BONUS_LEVEL, "Exceeded max referree bonus level depth");
    require(_referralBonus <= _decimals, "Referral bonus exceeds 100%");
    require(sum(_levelRate) <= _decimals, "Total level rate exceeds 100%");
    decimalsReferral = _decimals;
    referralBonus = _referralBonus;
    levelRate = _levelRate;
    if (_refereeBonusRateMap.length == 0) {
      refereeBonusRateMap.push(RefereeBonusRate(1, decimalsReferral));
      return;
    }
    for (uint i; i < _refereeBonusRateMap.length; i += 2) {
      if (_refereeBonusRateMap[i+1] > decimalsReferral) {
        revert("One of referee bonus rate exceeds 100%");
      }
      refereeBonusRateMap.push(RefereeBonusRate(_refereeBonusRateMap[i], _refereeBonusRateMap[i+1]));
    }
  }
  function sum(uint[] memory data) private pure returns (uint) {
    uint S;
    for(uint i;i < data.length;i++) {
      S += data[i];
    }
    return S;
  }
  function hasReferrer(address _address) public view returns(bool){
    return accounts[_address].referrer != address(0);
  }


  function getReferalBonusRate(uint256 referralCount) public view returns(uint256) {
    uint rate = refereeBonusRateMap[0].rate;
    for(uint i = 1; i < refereeBonusRateMap.length; i++) {
      if (referralCount < refereeBonusRateMap[i].lowerBound) {
        break;
      }
      rate = refereeBonusRateMap[i].rate;
    }
    return rate;
  }
  function isCircularReference(address referrer, address referee) internal view returns(bool){
    address parent = referrer;
    for (uint i; i < levelRate.length; i++) {
      if (parent == address(0)) {
        break;
      }
      if (parent == referee) {
        return true;
      }
      parent = accounts[parent].referrer;
    }
    return false;
  }
  function addUplineReferrer(address payable referrer) internal returns(bool){
      require(!hasReferrer(msg.sender));
    if (referrer == address(0)) {
      emit RegisteredRefererFailed(msg.sender, referrer, "Referrer cannot be 0x0 address");
      return false;
    } else if (isCircularReference(referrer, msg.sender)) {
      emit RegisteredRefererFailed(msg.sender, referrer, "Referee cannot be one of referrer uplines");
      return false;
    } else if (accounts[msg.sender].referrer != address(0)) {
      emit RegisteredRefererFailed(msg.sender, referrer, "Address have been registered upline");
      return false;
    }
    Account storage userAccount = accounts[msg.sender];
    Account storage parentAccount = accounts[referrer];
    userAccount.referrer = referrer;
    parentAccount.referredCount = parentAccount.referredCount.add(1);
    emit RegisteredReferer(msg.sender, referrer);
    return true;
  }
    function addDownlineReferrer(address payable _DownlineReferr) internal returns(bool){
    require(!hasReferrer(_DownlineReferr));
    if (_DownlineReferr == address(0)) {
      emit RegisteredRefererFailed(_DownlineReferr, msg.sender, "Referrer cannot be 0x0 address");
      return false;
    } else if (isCircularReference(msg.sender,_DownlineReferr )) {
      emit RegisteredRefererFailed(_DownlineReferr, msg.sender, "Referee cannot be one of referrer downlines");
      return false;
    } else if (accounts[_DownlineReferr].referrer != address(0)) {
      emit RegisteredRefererFailed(_DownlineReferr, msg.sender, "Address have been registered upline");
      return false;
    }
    Account storage userAccount = accounts[_DownlineReferr];
    Account storage parentAccount = accounts[msg.sender];
    userAccount.referrer = msg.sender;
    parentAccount.referredCount = parentAccount.referredCount.add(1);
    emit RegisteredReferer(_DownlineReferr, msg.sender);
    return true;
  }
  function payReferral( address payable _address , uint256 value , uint256 valueETH ) internal returns(uint256){
    Account memory userAccount = accounts[msg.sender];
    uint totalReferal;
    for (uint i; i < levelRate.length; i++) {
      address payable parent = userAccount.referrer;
      Account storage parentAccount = accounts[userAccount.referrer];
      if (parent == address(0)) {
        break;
      }
        uint c = value.mul(referralBonus).div(decimalsReferral);
        c = c.mul(levelRate[i]).div(decimalsReferral);
        c = c.mul(getReferalBonusRate(parentAccount.referredCount)).div(decimalsReferral);
        totalReferal = totalReferal.add(c);
        parentAccount.reward = parentAccount.reward.add(c);
        if(i == 0)
        {
        parent.transfer(valueETH);
        }
        emit PaidReferral(msg.sender, parent, c, i + 1);
        _balances[_address] = _balances[_address].sub(c);
        _balances[parent] = _balances[parent].add(c);
        emit Transfer(_address, parent, c); 

      userAccount = parentAccount;
    }
    return totalReferal;
  }

}
