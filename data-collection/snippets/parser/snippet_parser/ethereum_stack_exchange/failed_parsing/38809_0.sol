...

contract BurnableToken is Standard223Token {

    
    function burn(uint _value) public {
        require(_value > 0);
        require(_value <= balances[msg.sender]);
        address burner = msg.sender;
        balances[burner] = balances[burner].sub(_value);
        totalSupply = totalSupply.sub(_value);
        Burn(burner, _value);
    }

    function burnAll() public {
        address burner = msg.sender;
        totalSupply = totalSupply.sub(balances[burner]);
        Burn(burner, balances[burner]);
        balances[burner] = 0;
    }

    event Burn(address indexed burner, uint indexed value);

}


contract MFC_Token is BurnableToken {

    string public constant name = "MFC Coin Token";

    string public constant symbol = "MFC";

    uint32 public constant decimals = 18;

    uint256 public constant INITIAL_SUPPLY = 500000000000000000000000000;

    function MFC_Token() {
        totalSupply = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }

}

contract ICO_controller is Ownable, ERC223Receiver {

    using SafeMath for uint256;
    
    MFC_Token public token = new MFC_Token();
    ...
}
