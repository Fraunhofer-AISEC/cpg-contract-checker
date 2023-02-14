    function _createFNftToken(
        string calldata _name, 
        string calldata _symbol, 
        uint256 _amount,
        address _to
    ) private returns(address){
        fNftErc20 fNftErc20Token = new fNftErc20(_name, _symbol, _amount, _to);
        assert(address(fNftErc20Token) != address(0));
        return address(fNftErc20Token);
    }
