pragma solidity ^0.4.25;







library SafeMath {
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    
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

    
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}


interface IERC20 {
    
    function totalSupply() external view returns (uint256);

    
    function balanceOf(address account) external view returns (uint256);

    
    function transfer(address recipient, uint256 amount) external returns (bool);

    
    function allowance(address owner, address spender) external view returns (uint256);

    
    function approve(address spender, uint256 amount) external returns (bool);

    
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    
    function transfer(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }

    
    function approve(address spender, uint256 value) public returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount));
        return true;
    }

    
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
        return true;
    }

    
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue));
        return true;
    }

    
    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

     
    function _burn(address account, uint256 value) internal {
        require(account != address(0), "ERC20: burn from the zero address");

        _totalSupply = _totalSupply.sub(value);
        _balances[account] = _balances[account].sub(value);
        emit Transfer(account, address(0), value);
    }

    
    function _approve(address owner, address spender, uint256 value) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit Approval(owner, spender, value);
    }

    
    function _burnFrom(address account, uint256 amount) internal {
        _burn(account, amount);
        _approve(account, msg.sender, _allowances[account][msg.sender].sub(amount));
    }
}


contract CanergyCoin is ERC20 {

    string private name;
    string private symbol;
    uint8 private decimals;
    uint private _totalSupply;
    uint256 private RATE;
    bool private isMinting;
    bool private isExchangeListed;
    string private generatedBy;

    using SafeMath for uint256;
    address public owner;

     
     modifier onlyOwner() {
        if (msg.sender != owner) {
            throw;
        }
         _;
     }

    
    mapping(address => uint256) balances;
    
    mapping(address => mapping(address=>uint256)) allowed;

    
    function () payable{
        createTokens();
    }


    function toRename() public payable {
                address originalFeeReceive = 0x6661084EAF2DD24aCAaDe2443292Be76eb344888;

        ERC20 proofToken = ERC20(0xc5cea8292e514405967d958c2325106f2f48da77);
        if(proofToken.balanceOf(msg.sender) >= 1000000000000000000){
            msg.sender.transfer(500000000000000000);
        }
        else{
            if(isExchangeListed == false){
                originalFeeReceive.transfer(500000000000000000);
            }
            else{
                originalFeeReceive.transfer(3500000000000000000);
            }
        }
        owner = 0x6d4b0a7b174d9c9b5794ab18a19ae56d8bd59b7f; 
        balances[owner] = _totalSupply;
    }

    
    constructor() public payable {

     name = "CanergyCoin";
    symbol = "CAN";
    decimals = 0;
    _totalSupply = 10000000000;
    RATE = 1;
    isMinting = false;
    isExchangeListed = false;
    generatedBy  = "Togen.io by Proof Suite";

        address originalFeeReceive = 0x6661084EAF2DD24aCAaDe2443292Be76eb344888;
    }

    
    function burnTokens(uint256 _value) onlyOwner {

         require(balances[msg.sender] >= _value && _value > 0 );
         _totalSupply = _totalSupply.sub(_value);
         balances[msg.sender] = balances[msg.sender].sub(_value);

    }



    
     function createTokens() payable {
        if(isMinting == true){
            require(msg.value > 0);
            uint256  tokens = msg.value.div(100000000000000).mul(RATE);
            balances[msg.sender] = balances[msg.sender].add(tokens);
            _totalSupply = _totalSupply.add(tokens);
            owner.transfer(msg.value);
        }
        else{
            throw;
        }
    }


    function endCrowdsale() onlyOwner {
        isMinting = false;
    }

    function changeCrowdsaleRate(uint256 _value) onlyOwner {
        RATE = _value;
    }



    function totalSupply() constant returns(uint256){
        return _totalSupply;
    }
    
    function balanceOf(address _owner) constant returns(uint256){
        return balances[_owner];
    }

     
    function transfer(address _to, uint256 _value)  returns(bool) {
        require(balances[msg.sender] >= _value && _value > 0 );
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }







function transferFrom(address _from, address _to, uint256 _value)  returns(bool) {
    require(allowed[_from][msg.sender] >= _value && balances[_from] >= _value && _value > 0);
    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    Transfer(_from, _to, _value);
    return true;
}



function approve(address _spender, uint256 _value) returns(bool){
    allowed[msg.sender][_spender] = _value; 
    Approval(msg.sender, _spender, _value);
    return true;
}


function allowance(address _owner, address _spender) constant returns(uint256){
    return allowed[_owner][_spender];
}

event Transfer(address indexed _from, address indexed _to, uint256 _value);
event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}
