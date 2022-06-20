contract MyToken {

    string public name;
    string public symbol;
    uint8 public decimals;

    mapping (address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    
    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
    }   

   constructor(uint256 initialSupply, string memory tokenName, string memory tokenSymbol, uint8 decimalUnits) public {
        balanceOf[msg.sender] = initialSupply;              
        name = tokenName;                                   
        symbol = tokenSymbol;                               
        decimals = decimalUnits; 

    }

}
