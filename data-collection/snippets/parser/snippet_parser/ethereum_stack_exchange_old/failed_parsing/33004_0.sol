
pragma solidity ^0.4.18;


library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    
    uint256 c = a / b;
    
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b = a);
    return c;
  }
}


contract Ownable {
  address public owner;

  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  
  function Ownable() public {
    owner = msg.sender;
  }

  
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}



contract Pausable is Ownable {
  event Pause();
  event Unpause();

  bool public paused = false;


  
  modifier whenNotPaused() {
    require(!paused);
    _;
  }

  
  modifier whenPaused() {
    require(paused);
    _;
  }

  
  function pause() onlyOwner whenNotPaused public {
    paused = true;
    Pause();
  }

  
  function unpause() onlyOwner whenPaused public {
    paused = false;
    Unpause();
  }
}



interface Token { 
    function mint(address _to, uint256 _amount) public returns (bool);
    function transferOwnership(address newOwner) public;
    function finishMinting() public returns(bool);
    function totalSupply() public constant returns (uint256 supply);
}


contract IHTCSFiveFive is Ownable, Pausable {
    using SafeMath for uint256;

    
    uint256 public constant DECIMALS = 4;
    uint256 public constant MAX_TOKENS_AVAILABLE = 1 * (10**8) * (10**DECIMALS);        
    uint256 public constant MAX_TOKENS_FOR_SALE = 35 * (10**6) * (10**DECIMALS);        

    
    Token public token;                         

    uint256 public startTime;                   
    uint256 public endTime;
    address public wallet;                      
    uint256 public rate;                        
    uint256 public weiRaised;                   

    bool public isFinalized = false;            

    
    event RateChange(uint256 _rate);
    event WalletChange(address indexed _wallet);
    event EndTimeChange(uint256 _endTime);

    
    event TokenPurchase(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

    event Finalized();

    
    
    function setRate(uint256 _rate) external onlyOwner {
        require(_rate != 0x0);
        rate = _rate;

        RateChange(_rate);
    }

    
    function setEndTime(uint256 _endTime) external onlyOwner {
        require(!isFinalized);
        require(_endTime >= startTime);
        require(_endTime >= now);
        endTime = _endTime;

        EndTimeChange(_endTime);
    }

    
    function setWallet(address _wallet) external onlyOwner {
        require(_wallet != 0x0);
        wallet = _wallet;

        WalletChange(_wallet);
    }

    
    
    function IHTCSFiveFive(
        uint256 _startTime,
        uint256 _endTime,
        uint256 _rate,
        address _wallet,
        address _token
    ) public
    {
        require(_startTime >= now);
        require(_endTime >= _startTime);
        require(_rate > 0);
        require(_wallet != address(0));
        require(_token != 0x0);

        startTime = _startTime;
        endTime = _endTime;
        rate = _rate;
        wallet = _wallet;        

        token = Token(_token);
    }

    
    function () external payable {
        buyTokens(msg.sender);
    }

    
    
    function finalize() onlyOwner public {
        require(!isFinalized);
        require(hasEnded());

        finalization();
        Finalized();

        isFinalized = true;
    }

    
    
    function finalization() internal {
        
        if (token.totalSupply() = startTime) && (now = MAX_TOKENS_FOR_SALE;
        return now > endTime || capReached;
    }
}
