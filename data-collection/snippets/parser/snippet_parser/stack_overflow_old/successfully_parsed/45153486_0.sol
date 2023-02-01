contract OToken {

using SafeMath for uint256;

uint public _totalSupply = 0;
uint public constant _cap = 100000000;
string public constant symbol = "OXN";
string public constant name = "OToken";
uint public constant decimals = 18;

uint public oneTokenInWei = 183.602;
}