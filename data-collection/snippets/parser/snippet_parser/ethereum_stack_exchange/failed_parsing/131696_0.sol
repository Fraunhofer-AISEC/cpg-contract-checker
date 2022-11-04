

pragma solidity ^0.8.6;

contract Token{
    string public name;
    string public symbol;
    uint256 public decimal;
    uint256 public TotalSupply;
    mapping (address => uint256) public Balance;
    mapping (address => mapping(address => uint256)) public SpendingAllowance; 

    event TransferEvent(address indexed from, address indexed to, uint256 value);
    event AllowanceEvent(address indexed owner, address indexed spender, uint value);

    constructor(string memory _name, string memory _symbol, uint _decimal){
        name = _name;
        symbol = _symbol;
        decimal = _decimal;
        TotalSupply = 1000000000000000000000000;
        Balance[msg.sender] = TotalSupply;  

    }




    
    function dummytransfer(address _to, uint _value) external returns (bool){

        require(Balance[msg.sender] >= _value, "Insufficient funds to send ://"); 
        require(_to != address(0), "Invalid address"); 
        Realtransfer(msg.sender,_to,_value); 
        return true; 
    }

    function Realtransfer(address owner, address receiver, uint amount) internal{
        Balance[owner] = Balance[owner] - amount; 
        Balance[receiver] = Balance[receiver] + amount; 
        emit TransferEvent(owner,receiver,amount); 
    }

    
    function Approve(address _spender, uint _value) external returns(bool){
        require(_spender != address(0), "Invalid Address");
        SpendingAllowance[msg.sender][_spender] = _value;
        emit AllowanceEvent(msg.sender,_spender,_value);
        return true;
    }

    
    
    function AllowanceTransfer(address _from, address _to, uint amount) external returns(bool){
        require(Balance[_from] >= amount); 
        require(SpendingAllowance[_from][msg.sender] >= amount); 
        SpendingAllowance[_from][msg.sender] = SpendingAllowance[_from][msg.sender] - amount; 
        Realtransfer(_from,_to,amount); 
        return true;
    }



  
}```


  [1]: https:
  [2]: https:
