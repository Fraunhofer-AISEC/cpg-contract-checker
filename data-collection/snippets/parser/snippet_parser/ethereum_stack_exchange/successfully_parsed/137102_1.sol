 function testSwap4() public {
        uint256 swapAmount = 100;

        address[] memory tokensIn = new address[](1);
        tokensIn[0] = DAI;

        address[] memory tokensOut = new address[](0);

        swapBridge.preApproveTokens(tokensIn, tokensOut);

        AztecTypes.AztecAsset memory ethAsset = AztecTypes.AztecAsset({
            id: 0,
            erc20Address: address(0),
            assetType: AztecTypes.AztecAssetType.ETH
        });
        AztecTypes.AztecAsset memory tokenAsset = getRealAztecAsset(DAI);

        deal(DAI, address(ROLLUP_PROCESSOR), swapAmount);

        uint256 bridgeCallData = encodeBridgeCallData(id, tokenAsset, emptyAsset, ethAsset, emptyAsset, 0);

        (uint256 outputValueA, , ) = sendDefiRollup(bridgeCallData, swapAmount);

        assertGt(outputValueA, 0);
    }
