pragma solidity 0.4.8;

contract Adminstrator {
  address public admin;

  modifier onlyAdmin() { 
        if (msg.sender != admin) throw; 
        _; 

  } 

  function Adminstrator() {
    admin = msg.sender;
  }

  function transferAdminstrator(address newAdmin) onlyAdmin {
    admin = newAdmin; 
  }
}


contract Token
    {
    mapping (address=>uint256) public balanceOf;
    string public name;
    string public symbol;
    uint8 public decimal;
    uint256 public totalSupply;
    event TransferBal(address indexed from, address indexed to, uint256 value);

    function Token(uint256 initalSupply, string tokenName, string tokenSmybol, uint8 decimalUnits) {
        balanceOf[msg.sender] = initalSupply;
        totalSupply = initalSupply;
        decimal = decimalUnits;
        symbol = tokenSmybol;
        name = tokenName;
    }

    function Transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;

        if ((balanceOf[_to] + _value) < balanceOf[_to]) throw;

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        TransferBal(msg.sender, _to, _value);
    }
}

contract AssetToken is Adminstrator, Token {

  function AssetToken(uint256 initalSupply, string tokenName, string tokenSmybol, uint8 decimalUnits, address centralAdmin) Token(0, tokenName, tokenSmybol, decimalUnits) {
    totalSupply = initalSupply;
    if(centralAdmin != 0) {
        admin = centralAdmin;
    }
    else
    {
        admin = msg.sender;
    }
    balanceOf[admin] = initalSupply;
    totalSupply = initalSupply;
    }

    function mintToken(address target, uint256 mintedAmount) onlyAdmin{
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        TransferBal(0, this, mintedAmount);
        TransferBal(this, target, mintedAmount);
    }

    function Transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;
        if (balanceOf[msg.sender] < 0) throw;
        if ((balanceOf[_to] + _value) < balanceOf[_to]) throw;

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        TransferBal(msg.sender, _to, _value);
    }
} 
