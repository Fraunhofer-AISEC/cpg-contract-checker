function receiveApproval(address _from, uint _token, address _tokenContract, bytes memory _data) public {
    
    if(!ERC20Interface(_tokenContract).transferFrom(_from, address(this), _token)) {
        revert();
    }
    
    _0xChangeLib.place_sell_order(exchange, _from, _tokenContract, _token, _0xChangeLib.toUint256(_data, 0));

}
