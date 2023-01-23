  function getIn() public payable returns (uint256)  {

    uint256 _amount = 30000000000000000;
    require( msg.value >= _amount);
    require( msg.sender.balance >= _amount);

    balanceOf[ msg.sender ] -= _amount;
    msg.sender.transfer( msg.value - _amount);
}