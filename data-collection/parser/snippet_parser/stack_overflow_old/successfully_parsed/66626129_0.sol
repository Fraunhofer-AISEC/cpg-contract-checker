function myFunc() external payable {
    require(msg.value == 1 ether, 'Need to send 1 ETH');
}
