pragma solidity ^0.4.21;

import "./EIP20Interface.sol";


contract ablockstoken is EIP20Interface {

    uint256 constant private MAX_UINT256 = 2**256 - 1;
    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowed;

    uint8 public decimals;      
    uint256 public totalSupply;
    string public name;                                   
    string public symbol;   


    uint price = 0.01 ether;            
    string terms = 'Language explaining the terms of repurchasement at a later date';  

    function ablockstoken(      
        uint256 initialSupply,
        uint8 public decimals = 18, 
        string name,            
        string symbol
    ) public {

        totalSupply = initialSupply * 65536 ** uint256(decimals);  
        balanceOf[0xaddy] = totalSupply;
        totalSupply = initialSupply;    
        name = "ablockstoken";          
        symbol = "abt";                 
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value); 
        return true;
    }



    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowance >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value); 
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value); 
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

    

    function getTerms() constant returns(string) {
        return terms;
    }

    
        
    
    


    function withdraw() public {
        msg.sender.transfer(address(this).balance);
    }

    function deposit(uint256 amount) payable public {
        require(msg.value == amount);

    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

}
