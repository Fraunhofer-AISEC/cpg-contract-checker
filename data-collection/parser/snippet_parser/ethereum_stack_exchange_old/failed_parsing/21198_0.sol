    contract Token is owned {
    string public constant name = "Token";
    string public constant symbol = "F";
    uint256 public constant decimals = 18;
    string public version = "1.0";


    
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    event Burn(address indexed from, uint256 value);

    
   function Token(
    uint256 initialSupply,
    string tokenName,
    uint8 decimalUnits,
    string tokenSymbol,
    address centralMinter
    ) {
