function myFunc() external payable {
    require(msg.value == 1000000000000000000, 'Need to send 1 ETH');
}

function myFunc() external payable {
    require(msg.value == 1e18, 'Need to send 1 ETH');
}
