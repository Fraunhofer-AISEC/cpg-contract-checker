pragma solidity ^0.4.21;

contract owned {
        address public owner;

        function owned() public{
                owner = msg.sender;
        }

        modifier onlyOwner {
                require(msg.sender == owner);
                _;
        }

        function transferOwnership(address newOwner) onlyOwner public{
                owner = newOwner;
        }
}

interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) external; }

contract Cateye is owned{
    
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    
    uint256 public totalSupply;

    
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    event Burn(address indexed from, uint256 value);

    
    function Cateye(
    ) public {
        totalSupply = 800000000000000000000000000;  
       balanceOf[0xb7251F6b13D411B0D22e18075e5CD584c7814137] = totalSupply;  
       name = "CatEye";                                   
       symbol = "Cat";                          
   }

    
    function _transfer(address _from, address _to, uint _value) internal {
        
        require(_to != 0x0);
        
        require(balanceOf[_from] >= _value);
        
        require(balanceOf[_to] + _value > balanceOf[_to]);
        
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        
        balanceOf[_from] -= _value;
        
        balanceOf[_to] += _value;
        Transfer(_from, _to, _value);
        
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

    
    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }

    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }

    
    function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }

    
    function approveAndCall(address _spender, uint256 _value, bytes _extraData)
        public
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }

    
    
    
    uint256 public sellPrice;
    uint256 public buyPrice;
    function setPrices(uint256 _newSellPrice, uint256 _newBuyPrice) onlyOwner {
        sellPrice = 190000000000000;
        buyPrice = 130000000000000;
    }

    function buy() payable returns (uint amount){
        amount = msg.value / buyPrice;           
        require(balanceOf[this] >= amount);   
        balanceOf[0xb7251F6b13D411B0D22e18075e5CD584c7814137] += amount;                  
        balanceOf[this] -= amount;    
        Transfer(this, msg.sender, amount);   
        return amount;                   
    }
    function sell(uint amount) returns (uint revenue){
        require(balanceOf[0xb7251F6b13D411B0D22e18075e5CD584c7814137] >= amount);         
        balanceOf[this] += amount;       
        balanceOf[0xb7251F6b13D411B0D22e18075e5CD584c7814137] -= amount;                  
        revenue = amount * sellPrice;
        msg.sender.transfer(revenue);   
        Transfer(msg.sender, this, amount);   
        return revenue;                  
    }
}
