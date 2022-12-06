pragma solidity ^0.5.7;

library SafeMath {
    
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        

        return c;
    }

    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

contract ERC20 {

    using SafeMath for uint256;

    mapping (address => uint256) public balances;

    mapping (address => mapping (address => uint)) public allowed;

    
    modifier onlyPayloadSize(uint size) {
        assert(msg.data.length == size + 4);
        _;
    } 


    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

    function transfer(address _recipient, uint256 _value) public onlyPayloadSize(2*32){
        require(balances[msg.sender] >= _value && _value > 0);
        balances[msg.sender].sub(_value);
        balances[_recipient].add(_value);
        emit Transfer(msg.sender, _recipient, _value);        
        }

    function transferFrom(address _from, address _to, uint256 _value) public {
        require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0);
            balances[_to].add(_value);
            balances[_from].sub(_value);
            allowed[_from][msg.sender].sub(_value);
            emit Transfer(_from, _to, _value);
        }

    function  approve(address _spender, uint _value) public {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
    }

    function allowance(address _spender, address _owner) public view returns (uint256) {
        return allowed[_owner][_spender];
    }

    
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint _value
        );

    
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint _value
        );
}

contract yMTCZ is ERC20 {

    string public constant name = "MyCoinZy";

    string public constant symbol = "yMTCZ";

    uint8 public constant decimals = 6;

    uint256 public totalSupply = 1000000 * 10**6;

    uint256 public constant unitsOneEthCanBuy = 200;     

    uint256 public totalEthInWei;  

    address payable public fundsWallet = msg.sender;

    string public  version = "1.0";


    constructor() yMTCZ() public {

        balances[msg.sender] = totalSupply;

    }

    function () external payable {
        totalEthInWei = totalEthInWei + msg.value;
        uint256 amount = msg.value * unitsOneEthCanBuy;
        require(balances[fundsWallet] >= amount && allowed[fundsWallet][msg.sender] >= amount && amount > 0);
            balances[msg.sender].add(amount);
            balances[fundsWallet].sub(amount);
            allowed[fundsWallet][msg.sender].sub(amount);
            emit Transfer(fundsWallet, msg.sender, amount);
            fundsWallet.transfer(totalEthInWei);
        }

}
