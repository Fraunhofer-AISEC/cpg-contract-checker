# @version ^0.2

from vyper.interfaces import ERC20

interface PancakeRouter:
    def swapExactTokensForTokens(
        amountIn: uint256,
        amountOutMin: uint256,
        path: address[3],
        to: address,
        deadline: uint256
    ) -> uint256[3]: nonpayable

PANCAKESWAP: constant(address) = 0x10ED43C718714eb63d5aA57B78B54704E256024E
WBNB: constant(address) = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c

@external
def swap(tokenIn: address, tokenOut: address, amountIn: uint256):
    ERC20(tokenIn).transferFrom(msg.sender, self, amountIn)
    ERC20(tokenIn).approve(PANCAKESWAP, amountIn)

    res: Bytes[128] = raw_call(
        PANCAKESWAP,
        concat(
            method_id("swapExactTokensForTokens(uint256, uint256, address[], address, uint256)"),
            convert(amountIn, bytes32),
            convert(0, bytes32),
            convert(160, bytes32),
            convert(self, bytes32),
            convert(block.timestamp, bytes32),
            convert(3, bytes32),
            convert(tokenIn, bytes32),
            convert(WBNB, bytes32),
            convert(tokenOut, bytes32),
        ),
        max_outsize=128,
    )
