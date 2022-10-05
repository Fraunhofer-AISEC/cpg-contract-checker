contract A {

    function transferAndCall(address _to, uint256 _value, bytes _data)
        external
        returns (bool) 
    {
        require(_to != address(0));
        require(canAcceptTokens_[_to] == true);     
        require(transfer(_to, _value));             

        if (isContract(_to)) {
            B receiver = B(_to);
            require(receiver.tokenFallback(msg.sender, _value, _data));
        }

        return true;
    }
}

contract B {

    function tokenFallback(address _from, uint256 _value, bytes _data)
        onlyTokenContract()
        external
        returns (bool)
    {
        
        tokenBalanceLedger_[_from] = SafeMath.add(tokenBalanceLedger_[_from], _value);
        tokenSupply_ = SafeMath.add(tokenSupply_, _value);

        return true;
    }
}
