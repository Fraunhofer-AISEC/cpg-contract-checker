contract Fake_Smrt_Coin is EIC20{

uint256 constant private MAX_UINT256 = 2**256 - 1;
mapping (address => uint256) public balances;
mapping (address => mapping (address => uint256)) public allowed;

string public name;                   
uint8 public decimals;              
string public symbol;                 

function Fake_Smrt_Coin (
    uint256 _initialAmount,
    string _tokenName,
    uint8 _decimalUnits,
    string _tokenSymbol
) public {
    balances[msg.sender] = _initialAmount;
    totalSupply = _initialAmount;
    name = _tokenName;
    decimals = _decimalUnits;
    symbol = _tokenSymbol;
}

function transfer(address _to, uint256 _value) public returns (bool success) {
    require(balances[msg.sender] >= _value);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    emit Transfer(msg.sender, _to, _value); 
    return true;
}
}