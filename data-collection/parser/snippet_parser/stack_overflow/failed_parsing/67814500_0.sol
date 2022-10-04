pragma solidity ^0.4.21;



contract Ownable {
    address public owner;
    
    event OwnershipTransferred(address indexed previousOwner,
    address indexed newOwner);
    



function Ownable() public {
    owner = msg.sender;
}



modifier onlyOwner() {
    requir(msg.sender == owner);
    _;
}



function transferOwnership(address newOwner) public onlyOwner 
{
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
}

}


library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns 
    (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c; 
    }
    function div(uint256 a, uint256 b) internal pure returns
    (uint256) {
        
        uint256 c = a / b; 
        
        return c;
    }
    function sub(unit256 a, uint256 b) internal pure returns 
    (uint256) {
        assert(b <= a);
        return a - b; 
    }
    function add(uint256 a, uint256 b) internal pure returns
    (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}



contract ERC20 {
    uint256 public totalSupply;
  function balanceOf(address who) public view returns (uint256);

  function transfer (address to, uint256 value) public returns (bool);
  
  function allowance(address owner, address spender) public view returns (uint256);
  
  function transferFrom(addres from, address to, uint256 value) public returns (bool);
  
  function approve(address spender, uint256 value) public returns (bool);
  
  event Transfer(address indexed from, address indexed to, uint256 value);
  
  event approval(address indexed owner, address indexed spender, uint256 value);
    
}
contract HepburnA is ERC20, Ownable {
     using SafeMath for uint256; 
     
     
     address public hepburnDevmoon = 
     0x471E918a75A99038856eF9754368Eb1b5D15f9D5;
     
     
     address public hepburnCommunitymoon = 
     0x0554c3CF2315FB98181d1FEBfaf083cDf68Fa145;
     
     struct TokensWithLock{
         uint256 value;
         uint256 blockNumber;
         
     }
     
     mapping(address => uint256) balances;
     
     mapping(address => TokenswithLock) lockTokens;
     
     mapping(address => mapping (address => uint256)) allowed; 
     
     uint256 public totalSupplyCap = 1e11;
     
     string public name = "Hepburn A";
     string public symbol = "AUYHA";
     uint8 public decimals = 18;
     
     bool public mintingFinished = false;
     
     uint256 public deployBlockNumber = getCurrentBlockNumber();
     
     uint256 public constant TIMETHRESHOLD = 9720;
     
     uint256 public constant MINTTIME = 291600;
     
     uint256 public durationOfLock = 9720;
     
     bool public transferable = false; 
     
     bool public canSetTransferable = true;
     
     modifier canMint() {
         require(!mintingFinished);
         _;
     }
     
     modifier only(address _address) {
         require(msg.sender == _address);
         _;
     }
     
     modifier nonZeroAddress(address _address) {
         require(_address != address(0));
         _;
     }
     
     modifier canTransfer() {
         require(transferable == true);
     }
     
     event SetDurationOfLock(address indexed _caller);
     event ApproveMintTokens(address indexed _owner, uint256 _amount);
     event WithdrawMintTokens(address indexed _owner, uint256 _amount);
     event MintTokens(address indexed _owner, uint256 _amount);
     event BurnTokens(address indexed _owner, uint256 _amount);
     event MintFinished(address indexed _caller);
     event setTransferable(address indexed _address, bool _transferable);
     event SethepburnDevmoon(address indexed _old, address indexed _new);
     event DisableSetTransferable(ddress indexed _address, bool _canSetTransferable);
     
     function transfer(address _to, uint256 _value) canTransfer public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }

  
  function balanceOf(address _owner) public view returns (uint256 balance) 
  {
    return balances[_owner];
  }

  
  function transferFrom(address _from, address _to, uint256 _value) canTransfer public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    Transfer(_from, _to, _value);
    return true;
  }

  
  function approve(address _spender, uint256 _value) canTransfer public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }

  
  function allowance(address _owner, address _spender) public view returns (uint256) {
    return allowed[_owner][_spender];
  }

  
  function increaseApproval(address _spender, uint256 _addedValue) canTransfer public returns (bool) {
    allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
    Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

  function decreaseApproval(address _spender, uint256 _subtractedValue) canTransfer public returns (bool) {
    uint256 oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue > oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
    }
    Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }
  
  function setTransferable(bool _transferable) only(hepburnDevmoon) public {
    require(canSetTransferable == true);
    transferable = _transferable;
    SetTransferable(msg.sender, _transferable);
  }

  
  function disableSetTransferable() only(hepburnDevmoon) public {
    transferable = true;
    canSetTransferable = false;
    DisableSetTransferable(msg.sender, false);
  }

  
  function SethepburnDevmoon(address _hepburnDevmoon) only(hepburnDevmoon) nonZeroAddress(_hepburnDevmoon) public {
   hepburnDevmoon = _hepburnDevmoon;
    SethepburnDevmoon(msg.sender, _hepburnDevmoon);
  }
  
  function sethepburnCommunitymoon(address _hepburnCommunitymoon) only(hepburnCommunitymoon) nonZeroAddress(_hepburnCommunitymoon) public {
   hepburnCommunitymoon = _hepburnCommunitymoon;
    sethepburnCommunitymoon(msg.sender, _hepburnCommunitymoon);
  }
  
  function setDurationOfLock(uint256 _durationOfLock) canMint only(hepburnCommunitymoon) public {
    require(_durationOfLock >= TIMETHRESHOLD);
    durationOfLock = _durationOfLock;
    SetDurationOfLock(msg.sender);
  }
  
   function getLockTokens(address _owner) nonZeroAddress(_owner) view public returns (uint256 value, uint256 blockNumber) {
     return (lockTokens[_owner].value, lockTokens[_owner].blockNumber);
   }

  
  function approveMintTokens(address _owner, uint256 _amount) nonZeroAddress(_owner) canMint only(hepburnCommunitymoon) public returns (bool) {
    require(_amount > 0);
    uint256 previousLockTokens = lockTokens[_owner].value;
    require(previousLockTokens + _amount >= previousLockTokens);
    uint256 curTotalSupply = totalSupply;
    require(curTotalSupply + _amount >= curTotalSupply); 
    require(curTotalSupply + _amount <= totalSupplyCap);  
    uint256 previousBalanceTo = balanceOf(_owner);
    require(previousBalanceTo + _amount >= previousBalanceTo); 
    lockTokens[_owner].value = previousLockTokens.add(_amount);
    uint256 curBlockNumber = getCurrentBlockNumber();
    lockTokens[_owner].blockNumber = curBlockNumber.add(durationOfLock);
    ApproveMintTokens(_owner, _amount);
    return true;
  }
  
  function withdrawMintTokens(address _owner, uint256 _amount) nonZeroAddress(_owner) canMint only(hepburnCommunitymoon) public returns (bool) {
    require(_amount > 0);
    uint256 previousLockTokens = lockTokens[_owner].value;
    require(previousLockTokens - _amount >= 0);
    lockTokens[_owner].value = previousLockTokens.sub(_amount);
    if (previousLockTokens - _amount == 0) {
      lockTokens[_owner].blockNumber = 0;
    }
    WithdrawMintTokens(_owner, _amount);
    return true;
  }
  
  function mintTokens(address _owner) canMint only(hepburnDevmoon) nonZeroAddress(_owner) public returns (bool) {
    require(lockTokens[_owner].blockNumber <= getCurrentBlockNumber());
    uint256 _amount = lockTokens[_owner].value;
    uint256 curTotalSupply = totalSupply;
    require(curTotalSupply + _amount >= curTotalSupply); 
    require(curTotalSupply + _amount <= totalSupplyCap);  
    uint256 previousBalanceTo = balanceOf(_owner);
    require(previousBalanceTo + _amount >= previousBalanceTo); 
    
    totalSupply = curTotalSupply.add(_amount);
    balances[_owner] = previousBalanceTo.add(_amount);
    lockTokens[_owner].value = 0;
    lockTokens[_owner].blockNumber = 0;
    MintTokens(_owner, _amount);
    Transfer(0, _owner, _amount);
    return true;
  }
  
  function mintTokensWithinTime(address _owner, uint256 _amount) nonZeroAddress(_owner) canMint only(hepburnDevmoon) public returns (bool) {
    require(_amount > 0);
    require(getCurrentBlockNumber() < (deployBlockNumber + MINTTIME));
    uint256 curTotalSupply = totalSupply;
    require(curTotalSupply + _amount >= curTotalSupply); 
    require(curTotalSupply + _amount <= totalSupplyCap);  
    uint256 previousBalanceTo = balanceOf(_owner);
    require(previousBalanceTo + _amount >= previousBalanceTo); 
    
    totalSupply = curTotalSupply.add(_amount);
    balances[_owner] = previousBalanceTo.add(_amount);
    MintTokens(_owner, _amount);
    Transfer(0, _owner, _amount);
    return true;
  }
  
  function transferForMultiAddresses(address[] _addresses, uint256[] _amounts) canTransfer public returns (bool) {
    for (uint256 i = 0; i < _addresses.length; i++) {
      require(_addresses[i] != address(0));
      require(_amounts[i] <= balances[msg.sender]);
      require(_amounts[i] > 0);

      
      balances[msg.sender] = balances[msg.sender].sub(_amounts[i]);
      balances[_addresses[i]] = balances[_addresses[i]].add(_amounts[i]);
      Transfer(msg.sender, _addresses[i], _amounts[i]);
    }
    return true;
  }

  
  function burnTokens(uint256 _amount) public returns (bool) {
    require(_amount > 0);
    uint256 curTotalSupply = totalSupply;
    require(curTotalSupply >= _amount);
    uint256 previousBalanceTo = balanceOf(msg.sender);
    require(previousBalanceTo >= _amount);
    totalSupply = curTotalSupply.sub(_amount);
    balances[msg.sender] = previousBalanceTo.sub(_amount);
    BurnTokens(msg.sender, _amount);
    Transfer(msg.sender, 0, _amount);
    return true;
  }
  
  function finishMinting() only(hepburnDevmoon) canMint public returns (bool) {
    mintingFinished = true;
    MintFinished(msg.sender);
    return true;
  }

  function getCurrentBlockNumber() private view returns (uint256) {
    return block.number;
  }
}
}
}
