bool success, ) = IAPContract(APContract)
            .getStrategyFromMinter(msg.sender)
            .delegatecall(hexUtils.fromHex(data));
            revertDelegate(success);
