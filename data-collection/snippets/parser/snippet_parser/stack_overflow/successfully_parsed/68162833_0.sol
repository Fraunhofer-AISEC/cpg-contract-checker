contract Transaction{
    
    using SafeMath for uint256;

    mapping(address => uint256) balances;
    
    event Transfer(address buyer, address seller,uint value);
    


    function _transfer(address _from, address payable _to, uint256 _value) internal {
        require(balances[_from] >= _value, "Insufficient balance");
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(_from, _to, _value);
        _to.transfer(_value);
    }

   

    function transfer(address _from,address payable _to, uint256 _value) external payable returns (bool) {
        _transfer(_from, _to, _value);
        return true;
    }

}
