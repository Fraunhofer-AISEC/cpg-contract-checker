contract Coin is Owned, Token {

    Token implementation;

    function Coin(Token _implementation) {
        implementation = _implementation;
    }

    function transfer(address _to, uint256 _value) returns (bool success) {
        return implementation.transfer(_to, _value);
    }
}    
