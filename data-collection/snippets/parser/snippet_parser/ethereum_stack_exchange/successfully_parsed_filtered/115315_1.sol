

pragma solidity 0.8.4;


 
contract Alex{
    
    string public name;
    string public symbol ;
    uint256   _totalSupply; 
    uint8 public decimals ;
     uint _publicmoney;
      address public myaddress=address(this);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

   
    constructor()  {
         name = "Alex";
     symbol = "ali";
     _totalSupply = 1000000000 * 10 ** 18; 
     decimals = 18;


       myaddress=address(this);
       balanceOf[myaddress] =(_totalSupply*80)/100;
        _publicmoney =(_totalSupply*20)/100;
        balanceOf[msg.sender]= _publicmoney;
    }
    
    


    function ownmoney() public view returns (uint256) {
        return  balanceOf[myaddress];
    }
      
    function totalSupply() public view returns (uint256) {
        return  _publicmoney;
    }
    function transfer(address _to, uint256 _value)
        public
        returns (bool success)


    {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }



    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        allowance[myaddress];
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }


    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}

