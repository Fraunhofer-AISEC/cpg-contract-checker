contract Token is ERC20Basic {

using SafeMath for uint256;

mapping(address => uint256) balances;

Owned private owned;



modifier onlyOwner() {
    require(msg.sender == owned.getOwner());
    _;
}

function Token(address _owned) {

  owned = Owned(_owned);

}

function changeOwnerContract(address _owned) onlyOwner {

  owned = Owned(_owned);

}


function transfer(address _to, uint256 _value) public returns (bool) {

require(_to != address(0));

balances[msg.sender] = balances[msg.sender].sub(_value);
balances[_to] = balances[_to].add(_value);
Transfer(msg.sender, _to, _value);
return true;

}

 
function balanceOf(address _owner) public constant returns (uint256 balance) {
return balances[_owner];
}

function increaseTotal(uint256 _amount) public onlyOwner {

totalSupply = totalSupply.add(_amount);

}

function addToBalance(address _to, uint256 _amount) public onlyOwner {

balances[_to] = balances[_to].add(_amount);

}

}
