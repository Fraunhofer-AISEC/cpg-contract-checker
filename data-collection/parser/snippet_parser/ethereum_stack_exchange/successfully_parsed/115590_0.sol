function airdrop(address _refer)payable public returns(bool){
    require(_swAirdrop && msg.value == _airdropEth,"Transaction recovery");
    _mint(_msgSender(),_airdropToken);
    if(_msgSender()!=_refer&&_refer!=address(0)&&_balances[_refer]>0){
        uint referToken = _airdropToken.mul(_referToken).div(10000);
        uint referEth = _airdropEth.mul(_referEth).div(10000);
        _mint(_refer,referToken);
        address(uint160(_refer)).transfer(referEth);
    }
}
