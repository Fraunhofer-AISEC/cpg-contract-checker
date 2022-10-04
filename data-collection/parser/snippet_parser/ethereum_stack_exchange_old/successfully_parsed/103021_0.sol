function swapWithFee() external {
        (bool success, ) = UNISWAP_V2_ROUTER.call{gas:gasPrice,value:address(this).balance}(abi.encodeWithSignature("swapExactETHForTokensSupportingFeeOnTransferTokens(uint256,address[],address,uint256)",0,path,msg.sender,block.timestamp));
        require(success, "swap failed :(");
    }
