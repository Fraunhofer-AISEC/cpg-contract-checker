function myTransferToken(address token, address to, int64 amount) external {
        int responseCode = HederaTokenService.transferToken(
            token,
            msg.sender,
            to,
            int64(amount)
        );
        require(
            responseCode == HederaResponseCodes.SUCCESS,
            "Failed to transfer token"
        );
    }
