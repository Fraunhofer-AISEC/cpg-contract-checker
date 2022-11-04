pragma solidity ^0.4.2;


contract TrusteeFinTestToken {
    
    string public standard = 'Token 0.1';
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 ethtstraito = 100;
    uint256 public totalSupply;

    
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    function TrusteeFinTestToken(
        uint256 initialSupply,
        string tokenName,
        uint8 decimalUnits,
        string tokenSymbol
        ) {

        initialSupply = 10000000000 ;
        tokenName ="TrustiFintraTest";
        tokenSymbol="TFINT";
        decimalUnits = 4;
        balanceOf[msg.sender] = initialSupply;              
        totalSupply = initialSupply;                        
        name = tokenName;                                   
        symbol = tokenSymbol;                               
        decimals = decimalUnits;                            
        transferFromUser(this,initialSupply);

        }

    function setETHTokenTokenRaito(uint256 newRaito){
        ethtstraito = newRaito;
    }

    function() public payable{

        transferFromContract(msg.sender,msg.value/1000000000000000000*ethtstraito*10000);
    }

    function contractETHbalance() constant returns(uint256) {
        return this.balance;
        }

    
    function transferFromUser(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;           
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; 
        balanceOf[msg.sender] -= _value;                     
        balanceOf[_to] += _value;                            
        Transfer(msg.sender, _to, _value);                   
    }
        function transferFromContract(address _to, uint256 _value) {
        if (balanceOf[this] < _value) throw;           
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; 
        balanceOf[this] -= _value;                     
        balanceOf[_to] += _value;                            
        Transfer(this, _to, _value);                   
    }
}
