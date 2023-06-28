function approveTransfer(uint256 amount) public returns(string memory) {
        uint256 approveAmt = amount * 10**18;
        LINK.approve(_msgSender(),approveAmt);
        approvedAmount = approveAmt;
    }
