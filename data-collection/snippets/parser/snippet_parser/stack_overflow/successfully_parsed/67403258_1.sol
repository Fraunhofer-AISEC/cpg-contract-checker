function onTokenTransfer(address from, uint256 amount, bytes memory data)  public {
        receivedTokenTransfer = true;
        lastDepositer = from;
        lastDepositerAmountInLink = amount / 10**18;
    }
