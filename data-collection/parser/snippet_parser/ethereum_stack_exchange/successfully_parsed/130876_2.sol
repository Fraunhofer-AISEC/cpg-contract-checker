fallback() external payable {
        sig = abi.decode(msg.data[:4], (bytes4));
    }
