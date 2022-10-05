  function multiTransfer(address[] _addresses, uint[] _amounts)
    payable public returns(bool)
    {
        uint toReturn = msg.value;
        for (uint i = 0; i < _addresses.length; i++) {
            _safeTransfer(_addresses[i], _amounts[i]);
            toReturn = SafeMath.sub(toReturn, _amounts[i]);
            MultiTransfer(msg.sender, msg.value, _addresses[i], _amounts[i]);
        }
        _safeTransfer(msg.sender, toReturn);
        return true;
    }


 function multiERC20Transfer(
        ERC20 _token,
        address[] _addresses,
        uint[] _amounts
    ) public {
        for (uint i = 0; i < _addresses.length; i++) {
            _safeERC20Transfer(_token, _addresses[i], _amounts[i]);
            MultiERC20Transfer(
                msg.sender,
                msg.value,
                _addresses[i],
                _amounts[i],
                _token
            );
        }
}