    pragma solidity ^0.4.16;

contract owned {
    address public owner;

    function owned() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        owner = newOwner;
    }
}

interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public; }

contract MyCoin {
    
    string public name = "MyCoin";
    string public symbol = "XYZ";
    uint8 public decimals = 18;
    
    uint256 public totalSupply;
    uint256 initialSupply = 50000000;

    
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    event Burn(address indexed from, uint256 value);

    
    function MyCoin() public {
        totalSupply = initialSupply * 10 ** uint256(decimals);  
        balanceOf[this] = totalSupply;                
        
        
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
        _transfer(this, _to, _value);
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

    
    function burn(uint256 _value) public returns (bool success) {
        require(balanceOf[this] >= _value);   
        balanceOf[this] -= _value;            
        totalSupply -= _value;                      
        Burn(this, _value);
        return true;
    }

    
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value);                
        require(_value <= allowance[_from][msg.sender]);    
        balanceOf[_from] -= _value;                         
        allowance[_from][msg.sender] -= _value;             
        totalSupply -= _value;                              
        Burn(_from, _value);
        return true;
    }
}





contract MyAdvancedToken is owned, MyCoin {

    uint256 public sellPrice = 500;
    uint256 public buyPrice = 500;
    uint256 private endTime = 1516060799; 

    uint256 private phaseOneStart = 14512864000; 
    uint256 private phaseOneEnd = 1413036800; 

    uint256 private phaseTwoStart = 1513067359; 
    uint256 private phaseTwoEnd = 1513110559; 

    uint256 private xmasStart = 1513081759; 
    uint256 private xmasEnd = 1513114159;   
    uint256 private newyearStart = 1514764800;  
    uint256 private newyearEnd = 1514851199;    

    mapping (address => bool) public frozenAccount;

    
    event FrozenFunds(address target, bool frozen);

    
    function MyAdvancedToken() MyCoin() public {}

    
    function _transfer(address _from, address _to, uint _value) internal {
        require (_to != 0x0);                               
        require (balanceOf[_from] > _value);                
        require (balanceOf[_to] + _value > balanceOf[_to]); 
        require(!frozenAccount[_from]);                     
        require(!frozenAccount[_to]);                       
        balanceOf[_from] -= _value;                         
        balanceOf[_to] += _value;                           
        Transfer(_from, _to, _value);
        owner.transfer(this.balance);                       
    }

    
    
    
    function mintToken(address target, uint256 mintedAmount) onlyOwner public {
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        Transfer(0, this, mintedAmount);
        Transfer(this, target, mintedAmount);
    }

    
    
    
    function freezeAccount(address target, bool freeze) onlyOwner public {
        frozenAccount[target] = freeze;
        FrozenFunds(target, freeze);
    }

    
    
    
    function setPrices(uint256 newSellPrice, uint256 newBuyPrice) onlyOwner public {
        sellPrice = newSellPrice;
        buyPrice = newBuyPrice;
    }

    
    function () payable public {

        
        require(msg.value >= 1 / buyPrice);

        
        require(now < endTime);

        
        uint amount = calculateAmount(msg.value);
        uint bonus = getBonus(amount);

        
        

        _transfer(this, msg.sender,  amount + bonus);
    }

    
    function getBonus(uint _amount) constant private returns (uint256) {
        if((now >= xmasStart && now <= xmasEnd) || (now >= newyearStart && now <= newyearEnd)) { 
            return _amount * 50 / 100;
        }  else {
            return 0;
        }


    }

    
    function calculateAmount(uint _amount) constant private returns (uint256) {
        
        if(now >= phaseOneStart && now <= phaseOneEnd) { 
            
            return _amount * buyPrice + (_amount * buyPrice * 50 / 100);
        } 
        
        else if (now >= phaseTwoStart && now <= phaseTwoEnd) { 
            return _amount * buyPrice;
        } 
        
        else {
            return _amount * buyPrice - (_amount * buyPrice * 50 / 100);
        }
    }

    
    
    function sell(uint256 amount) public {
        require(this.balance >= amount * sellPrice);      
        _transfer(msg.sender, this, amount);              
        msg.sender.transfer(amount * sellPrice);          
    }
}
