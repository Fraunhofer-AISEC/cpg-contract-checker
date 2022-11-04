 function setdebtor(address _address, uint _checkId, uint256  _amount) segurity public {
        check[_checkId] = _amount;
        debtor[_address] = true;

}
