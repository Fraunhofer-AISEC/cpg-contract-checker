
const WBNBHERORouterContract = new ethers.Contract(
    router,
    [
        `function getAmountsOut(uint amountIn, address[] memory path) internal view returns (uint[] memory amounts)`,
        `function swapExactETHForTokens(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts)`
    ],
    signer
);
const tx = await WBNBHERORouterContract.swapExactETHForTokens(
            wbnbAmount,
            minAmountToBuy,
            [WBNB, HERO],
            wallet.address,
            Date.now() + 1000 * 60,
            {gasLimit: 251234}
        )

receipt = await tx.wait();
