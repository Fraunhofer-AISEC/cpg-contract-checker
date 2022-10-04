pragma solidity ^0.4.24;

contract TheCaseOfTHeMissingCoins{

    string public name;
    string public symbol;
    uint8 public decimals = 18;
    address public owner;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;


    event Transfer(address indexed from, address indexed to, uint256 value);


    constructor(
        uint256 initialSupply,
        string tokenName,
        string tokenSymbol
    ) public {
       initialSupply = initialSupply * 10 ** uint256(decimals); 
        balanceOf[msg.sender] = initialSupply;               
        name = tokenName;                                 
        symbol = tokenSymbol;    
        owner = msg.sender;

    }

        
    
    
    function TESTbuyCoins() public payable{
        uint amount = TESTcalculateAmountOfCoins(msg.value);
        _transfer(owner, msg.sender, amount);
        owner.transfer(msg.value);
    }
    
    
    

    
    function _transfer(address _from, address _to, uint _value) internal {
        
        require(_to != 0x0);
        
        require(balanceOf[_from] >= _value);
        
        require(balanceOf[_to] + _value > balanceOf[_to]);
        
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        
        balanceOf[_from] -= _value;
        
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }


    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }

    function TESTcalculateAmountOfCoins(uint coinsWanted) public returns(uint totalCoins){
            totalCoins = coinsWanted * 48;
        return(totalCoins);
    } 
}
