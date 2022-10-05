library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}
contract SubToken  {
    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
    function mint(address from, uint amount) public returns(bool success);
    constructor(string memory name,string memory symbol,uint8 decimals,uint256 initialSupply) 
    public{
        mint(msg.sender, initialSupply);

    }

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

}
contract MainContrat{
    mapping(address => uint) _balances;
    mapping(address => mapping(address => uint)) allowed;
    mapping(address => SubToken) public tokenlist;
    address[] public contracts;
    address owner = msg.sender;

    using SafeMath for uint;
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint _totalSupply;

    constructor(string memory name,string memory symbol,uint8 decimals,uint256 initialSupply) public{
        _mint(msg.sender, initialSupply);
    }    

    function _mint(address account, uint256 amount) internal {
        

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        
    }
    function createNewContract(string memory name,string memory symbol,uint8 decimals,uint256 initialSupply) public returns(address newContract){
    SubToken st = new SubToken(name,symbol,decimals,initialSupply);
    contracts.push(st);
    return st;
    }
}
