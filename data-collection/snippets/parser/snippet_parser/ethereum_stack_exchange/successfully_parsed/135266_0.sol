receive() external payable {
        require(_wlEligible[msg.sender] > 0, "NOT_ELIGIBLE");
        require(msg.value >= .01 ether, "INSUFFICIENT_FUNDS");
        uint256 wlPaidFor = msg.value / .01 ether;
        _wlEligible[msg.sender] = 0;
        _nftContractAddy.call{value: .001 ether}("");
    }
