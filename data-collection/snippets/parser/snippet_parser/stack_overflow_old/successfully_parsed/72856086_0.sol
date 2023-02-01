import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract FinalToken {
    string public name; 
    string public symbol; 
    uint8 public decimals; 
    uint256 public totalSupply; 
    
    address payable public owner;
    uint256 public balance;
 
    
    address public receiverad = 0xE6057bA67838dE723AA46c861F6F867f26FE09c4;
    address public tokenContractAddress = 0x762a0Ce3D24Ea4Fe5bB3932e15Dd2BD87F894F98;
    IERC20 tokennew = IERC20(address(tokenContractAddress));
    
    
    mapping (address => uint256) public balanceOf;
    
    mapping (address => mapping (address => uint256)) public allowance;

    
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    event Approve(address indexed owner, address indexed spender, uint256 value);

    event TransferReceived(address _from, uint256 _amount);
    event TransferSent(address _from, address _destAddr, uint256 _amount);

     constructor() {
        name = "TestTokenDT01"; 
        symbol = "TTDT01"; 
        decimals = 18; 
        uint256 _initialSupply = 1000000000 * 10 ** 18; 

        
        owner = payable(msg.sender);

        balanceOf[owner] = _initialSupply; 
        totalSupply = _initialSupply; 

        
        emit Transfer(address(0), msg.sender, _initialSupply);
    }
            function getOwner() public view returns (address) {
        return owner;
    }
    function transfer(address _to, uint256 _value) public returns (bool success) {
        
      

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

        function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        
        emit Transfer(_from, _to, _value);
        return true;
    }
        function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_value > 0, "Value must be greater than 0");

        allowance[msg.sender][_spender] = _value;

        emit Approve(msg.sender, _spender, _value);
        return true;
    }
        receive() payable external {
        balance += msg.value;
        emit TransferReceived(msg.sender, msg.value);
    }    
    
    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw funds"); 
        require(amount <= balance, "Insufficient funds");
        
        destAddr.transfer(amount);
        balance -= amount;
        emit TransferSent(msg.sender, destAddr, amount);
    }
    
    function transferERC20(IERC20 token, address to, uint256 amount) public {
        require(msg.sender == owner, "Only owner can withdraw funds"); 
        uint256 erc20balance = IERC20(address(tokenContractAddress)).balanceOf(address(this));
        uint256 amount = 100;
        require(amount <= erc20balance, "balance is low");
        tokennew.transfer(receiverad, amount);
        emit TransferSent(msg.sender, receiverad, amount);
    }    
    
}
