contract TWTD {
    mapping (address => uint256) public ownerTobalance;
    mapping (address => mapping (address => uint256)) public allowance;
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);
    string TokenName;
    string Symbol;
    uint8 decimals = 18;
    uint256 totalsupply;

    using SafeMath for uint256;

    function TWTD(string _name, string _symbol, uint256 _initialsupply) public {
        ownerTobalance[msg.sender] = _initialsupply;
        totalsupply = _initialsupply;
        TokenName = _name;
        Symbol = _symbol;
    }

    function totalSupply() public view returns (uint256){
        return totalsupply;
    }

    function balanceOf(address who) public view returns (uint256) {
        return ownerTobalance[who];
    }

    function _transfer(address from, address to, uint256 value) internal {
        require ( to != 0x0);
        require (ownerTobalance[from] >= value);
        uint256 Balance = ownerTobalance[from] + ownerTobalance[to];
        ownerTobalance[from].sub(value);
        ownerTobalance[to].add(value);
        assert(ownerTobalance[from] + ownerTobalance[to] == Balance);
        emit Transfer(from,to,value);
    }

    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender,to,value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        require (allowance[from][msg.sender] >= value);
        allowance[from][msg.sender].sub(value);
        _transfer(from,to,value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool) {
        require(value > 0);
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender,spender,value);
        return true;
    }

    function allowance(address owner, address spender)
    public view returns (uint256) {
        return allowance[owner][spender];
    }
}
