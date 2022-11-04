contract ReceiveOnEvenSeconds {
    function() external payable {
        require(now % 2 == 0, "I only receive ether on even seconds.");
    }
}
