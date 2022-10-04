pragma solidity ^0.4.18;

contract ReleaseShares {
    string public constant symbol = "Test";
    string public constant name = "Test Release";
    uint8 public constant decimals = 18;
    uint256 public totalSupply = 10000000;
    address public owner;
    uint public creationTime;

    
    function ReleaseShares() public {
        owner = msg.sender;
        balances[owner] = totalSupply;
        creationTime = now;
    }

    modifier releaseOfSharesOK() {
        require(now >= (creationTime + 300));
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;

    function balanceOf(address _owner) constant public returns (uint256 balance) {
        return balances[_owner];
    }

    
    function transfer(address _to, uint256 _amount) public returns (bool success) {
        if (balances[msg.sender] >= _amount 
            && _amount > 0
            && balances[_to] + _amount > balances[_to]) {
            balances[msg.sender] -= _amount;
            balances[_to] += _amount;
            return true;
        } else {
            return false;
        }
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) public returns (bool success) {
        if (balances[_from] >= _amount
            && allowed[_from][msg.sender] >= _amount
            && _amount > 0
            && balances[_to] + _amount > balances[_to]) {
            balances[_from] -= _amount;
            allowed[_from][msg.sender] -= _amount;
            balances[_to] += _amount;
            return true;
        } else {
            return false;
        }
    }

    
    
    function approve(address _spender, uint256 _amount) public returns (bool success) {
        allowed[msg.sender][_spender] = _amount;
        return true;
    }

    function allowance(address _owner, address _spender) constant public returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

    function() public payable { }

    
    
    
    struct Holder {
        uint amount;
        string fName;
        string lName;
    }

    mapping (address => Holder) holders;
    address[] public holderAccts;

    function setHolder(
        address _address, 
        uint _amount, 
        string _fName, 
        string _lName
        ) onlyOwner public {
            var holder = holders[_address];

            holder.amount = _amount;
            holder.fName = _fName;
            holder.lName = _lName;

            holderAccts.push(_address) -1;
    }

    function getHolders() view public returns(address[]) {
        return holderAccts;
    }

    function getHolder(address _address) view public returns (uint, string, string) {
        return (holders[_address].amount, holders[_address].fName, holders[_address].lName);
    }

    function countHolders() view public returns (uint) {
        return holderAccts.length;
    }

    function releaseHolderShares() releaseOfSharesOK onlyOwner public {
        uint256 numberOfAccts = holderAccts.length;
        for (uint i = 0; i < numberOfAccts; i ++) {
            transfer(holderAccts[i], holders[holderAccts[i]].amount);
        }
    }
}
