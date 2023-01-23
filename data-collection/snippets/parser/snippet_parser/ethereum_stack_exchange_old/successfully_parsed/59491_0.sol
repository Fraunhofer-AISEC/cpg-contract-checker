contract StandardToken is ERC20, BasicToken {
   using SafeMath for uint256;
   
   string public name = "Autobay";
   
   string public symbol = 'ABX';
   
   
   string public standard = 'ABX 0.1';
    
   
    uint256 public tokenPrice = 100000; 
    
    uint256 public  amount;
    
    
    uint256 public constant decimals = 18;
    
    uint256 public totalSupply;

   constructor(uint256 _intialSupply) {
      balances[msg.sender] = _intialSupply;
      totalSupply = _intialSupply;
    }

   event Transfer(address indexed _form,address indexed _to,uint256 amount);
   event Approval(address indexed _owner,address indexed _spender,uint256 _value);
   mapping (address => mapping (address => uint256)) internal allowed;

   function transfer(address _to, uint256 _value) public returns (bool) {
      amount = _value * 10**decimals;
      
      require(_to != address(0));
      require(amount <= balances[msg.sender]);

      
      balances[msg.sender] = balances[msg.sender].sub(amount);
      balances[_to] = balances[_to].add(amount);

      emit  Transfer(msg.sender, _to, amount);
      return true;
   }
}
