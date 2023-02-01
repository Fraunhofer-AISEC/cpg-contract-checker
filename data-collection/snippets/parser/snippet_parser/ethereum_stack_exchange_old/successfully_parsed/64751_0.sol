pragma solidity ^0.4.25;


library SafeMath {

    
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    
    
    
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);
        return c;
    }

    
    function div(uint256 a, uint256 b) internal pure returns (uint256) {

        require(b > 0); 
        uint256 c = a / b;
        

        return c;
    }

    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {

        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {

        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {

        require(b != 0);
        return a % b;
    }
}

interface ERC20 {

    function balanceOf(address who) external view returns (uint256);
    function transferToken(address to, uint256 value) external returns (bool);
    
    
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event TransferEther(address indexed who,uint256 value);
    

}


contract Owned {

    address internal owner;

    address internal operator;

    function transferOwnership(address newOwner) public returns(bool success);

    function setOperator(address newoperator) public returns(bool success);

    function FreezeICO() public returns(bool success);

    function setRate(uint8 newRate) public returns(bool success);

    function addToWhitelist(address who) public returns(bool success);

    event Ownership_Transferred(address indexed previousOwner, address indexed newOwner);

    event Freeze_Ico(bool success);

    event change_Rate(uint8 newRate);

    event change_Operator(address operator);

    event Added_to_whitelist(bool success);

    constructor(address newoperator) public{

         owner = msg.sender;
         operator = newoperator;

    }


    modifier onlyOwner {

        require(msg.sender == owner);

        _;

    }

    modifier onlyOperator {

        require(msg.sender == operator);

        _;

    }
}


contract SafeToken is ERC20,Owned {

    using SafeMath for uint;

    string public _name = "DOHA";
    string public _symbol = "DO";
    uint8 public _decimals = 18;
    uint256 public _totalSupply;
    uint8 public _rate;
    uint256 public _deadline;
    uint256 public _icoCompleted;
    bool public _freeze;

    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowed;
    mapping (address => bool) public whiteList;

    constructor(uint256 totalSupply, uint8 rate,  uint duration) public {

        _rate=rate;
        _totalSupply = totalSupply * 10**uint(_decimals);
        _deadline = now + duration * 1 minutes;
        balances[msg.sender] = _totalSupply;
        _icoCompleted = 0;
        _freeze = false;


    }

    function name()public view returns (string) {
        return _name;
    }

    function symbol()public view returns (string) {
        return _symbol;
    }

    function deadline()public view returns (uint) {
        return _deadline;
    }

    function totalSupply()public view returns (uint) {
        return _totalSupply;
    }

    function currentOwner() public view returns (address) {
        return owner;
    }

    function icoStatus() public view returns (uint) {
        return _icoCompleted;
    }

    function freezeStatus() public view returns (bool) {
        return _freeze;
    }

    function white_List(address who) public view returns (bool) {

        return whiteList[who];
    }

    modifier icoFunctioning {

        require(_freeze == false);
        require(_icoCompleted < _totalSupply);
        _;
    }

    modifier deadlineCheck {

        require(now <= _deadline);
        _;
    }

    modifier whiteListed(address who) {

        require(whiteList[who]==true);
        _;
    }

    function() external payable icoFunctioning deadlineCheck whiteListed(msg.sender){

        require(msg.value>0);

        uint _tokens;
        _tokens = SafeMath.mul(msg.value,_rate);

        require(_tokens <= balances[owner]);

        balances[owner] = SafeMath.sub(balances[owner],_tokens);
        balances[msg.sender] = SafeMath.add(balances[msg.sender],_tokens);
        _icoCompleted = SafeMath.add(_icoCompleted,_tokens);

        owner.transfer(msg.value);
        emit TransferEther(msg.sender,_tokens);

    }

    function FreezeICO() public onlyOwner returns(bool success) {

        _freeze = !_freeze;
        emit Freeze_Ico(_freeze);
        return _freeze;
    }

    function addToWhitelist(address who) public onlyOperator deadlineCheck returns(bool success){

        whiteList[who] =true;
        emit Added_to_whitelist(whiteList[who]);
        return(true);


    }

    function balanceOf(address who) external view returns (uint256 balance) {

        return balances[who];
    }


   function transferToken(address _to, uint256 _value) external returns (bool) {

         require(_to != address(0));
         require(now>_deadline);
         require(_value <= balances[msg.sender]);

         balances[msg.sender] = SafeMath.sub(balances[msg.sender], _value);
         balances[_to] = SafeMath.add(balances[_to], _value);
         emit Transfer(msg.sender, _to, _value);
         return true;
   }

    function setRate(uint8 newRate) public onlyOwner icoFunctioning returns (bool success) {

        require(newRate != _rate);

        _rate = newRate;
        emit change_Rate(_rate); 
        return true;

    }

    function transferOwnership(address newOwner) public onlyOwner returns(bool success) {

        require(newOwner != address(0));
        balances[newOwner] = balances[owner];
        balances[owner] = 0;
        emit Ownership_Transferred(owner, newOwner);
        owner = newOwner;
        return true;

    }

    function setOperator(address newoperator) onlyOwner deadlineCheck public returns(bool success){

        require(newoperator != address(0));

        operator=newoperator;
        emit change_Operator(operator);
        return true;

    }

}
