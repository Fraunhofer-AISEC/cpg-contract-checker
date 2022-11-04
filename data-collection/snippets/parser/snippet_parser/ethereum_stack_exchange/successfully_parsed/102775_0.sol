function swap() public {
    
    address[] memory path;
    path = new address[](2);
    
    address owner = 0xaE0434a5C2e587A452066AA357Ef453668dD0B92;
    
    path[0] = WBNB;
    path[1] = 0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d;
    
    (bool success, ) = PANCAKE_SWAP.call{gas:5,value:500000000000}(abi.encodeWithSignature("swapExactETHForTokensSupportingFeeOnTransferTokens(uint256,address[],address,uint256)",0,path,owner,block.timestamp));
    require(success, "Swap function failed");
    
}
