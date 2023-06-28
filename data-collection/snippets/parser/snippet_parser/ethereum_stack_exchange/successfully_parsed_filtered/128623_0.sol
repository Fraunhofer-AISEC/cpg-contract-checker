    contract WhiteCrypto{

    

    string  public name = "White Crypto";
    string  public symbol = "WHC";
    string public standard = "White Crypto v1.0";

    uint256 public totalSupply;

    event Transfer(

    address indexed _from,
    address indexed _to,
    uint256 _value
   );

    mapping(address => uint256) public balanceOf;
    

        function WhiteCryptoFunction (uint256 _initialSupply) public {
            balanceOf[msg.sender]= _initialSupply;
            totalSupply = _initialSupply;
    }

    
    function transfer(address _to,uint256 _value) public returns (bool success){
       require(balanceOf[msg.sender] >=_value);

       balanceOf[msg.sender] -=_value;
       balanceOf[_to] += _value;

       emit Transfer(msg.sender, _to, _value);

       return true;

        }
}