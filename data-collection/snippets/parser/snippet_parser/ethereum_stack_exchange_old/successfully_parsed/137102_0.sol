  function testSwap3() public {
        uint256 swapEth = 1 ether;

        address[] memory tokensIn = new address[](0);

        address[] memory tokensOut = new address[](1);
        tokensOut[0] = DAI;

        swapBridge.preApproveTokens(tokensIn, tokensOut);

         AztecTypes.AztecAsset memory ethAsset = AztecTypes.AztecAsset({
            id: 0,
            erc20Address: address(0),
            assetType: AztecTypes.AztecAssetType.ETH
        });

        AztecTypes.AztecAsset memory tokenAsset = getRealAztecAsset(DAI);

        deal(address(ROLLUP_PROCESSOR), swapEth);

        uint256 bridgeCallData = encodeBridgeCallData(id, ethAsset, emptyAsset, tokenAsset, emptyAsset, 0);

        (uint256 totalOutputValueA , , ) = sendDefiRollup(bridgeCallData, swapEth);
        
        assertGt(totalOutputValueA, 0);
    }
