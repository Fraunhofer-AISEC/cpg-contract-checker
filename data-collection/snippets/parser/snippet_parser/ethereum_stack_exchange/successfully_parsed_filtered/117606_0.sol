function pairFor(address factory, address tokenA, address tokenB) public view returns (address pair) {
        (address token0, address token1) = sortToken(tokenA, tokenB);
        pair = address(uint(keccak256(abi.encodePacked(
                hex'ff',
                factory,
                keccak256(abi.encodePacked(token0, token1)),
                hex'96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f' 
            ))));
    }
