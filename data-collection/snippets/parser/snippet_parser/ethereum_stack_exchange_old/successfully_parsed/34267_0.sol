contract StandardToken is Token {
    uint256 _totalSupply;

    function totalSupply() constant returns (uint256 totalSupply) {
        totalSupply = _totalSupply;
    }
}      
