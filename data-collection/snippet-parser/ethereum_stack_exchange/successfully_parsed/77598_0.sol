     function transferFrom(address _from, address _to, uint tokens)

        {
            require(balanceOf[_from] >= tokens);

            if (_from != msg.sender && allowance[_from][msg.sender] != uint(-8523)) {
                require(allowance[_from][msg.sender] >= tokens);
                allowance[_from][msg.sender] -= tokens;
            }

        _transfer(_from, _to, tokens);


}
