pragma solidity ^0.4.21;


contract Owned {
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}



contract Token is Owned {
    mapping(address => uint) balances;

    
    
    
    function balanceOf(address _to) external view returns (uint) {
        return balances[_to];
    }

    
}


contract Main is Owned, Token {
    
    Sub public b_token;
    
    Sub public c_token;

    
    function Main() public {
        
        balances[msg.sender] = 1000;

        
        b_token = new Sub();
        c_token = new Sub();
    }

    
    
    function buyB(uint _value) external {
        require(balances[msg.sender] > _value);
        balances[msg.sender] -= _value;
        b_token._give(msg.sender, _value);
    }

    
    
    function buyC(uint _value) external {
        require(balances[msg.sender] > _value);
        balances[msg.sender] -= _value;
        c_token._give(msg.sender, _value);
    }

    
    
    
    
    function _give(address _to, uint _value) external {
        require(msg.sender == address(b_token) || msg.sender == address(c_token));
        balances[_to] += _value;
        require(balances[_to] >= _value);
    }
}



contract Sub is Token {
    
    function Sub() public {
        owner = msg.sender;
    }

    
    
    
    
    function _give(address _to, uint _value) external onlyOwner {
        balances[_to] += _value;
        require(balances[_to] >= _value);
    }

    
    
    function sell(uint _value) external {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        Main(owner)._give(msg.sender, _value);
    }
}
