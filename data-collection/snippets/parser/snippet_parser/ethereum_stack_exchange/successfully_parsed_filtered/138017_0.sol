contract ChildContract {

   function sendTokenTo(uint _amount, ITRC20 _token, address payable _receiver) external payable onlyOwner {
       
        _token.transfer(_receiver,  _amount);
    }
    receive() external payable {}
}

contract mainContract {

  function deploy_child_in_token_mode(uint _uuid, ITRC20 _token, uint _amount, address payable _receiver) external {

address a =  address(new ChildContract{salt: bytes32(_uuid)}(msg.sender)); 
ChildContract(payable(a)).sendTokenTo(_amount, _token, _receiver);

}
}