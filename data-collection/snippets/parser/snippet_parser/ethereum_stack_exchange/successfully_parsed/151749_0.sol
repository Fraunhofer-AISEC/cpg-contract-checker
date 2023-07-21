uint160 sqrtRatioX96 = 1827333235122231383957021222;
uint256 ratio = sqrtRatioX96.formatSqrtPriceX96ToPriceX96().formatX96ToX10_18();
uint256 sqrtRatioX96b = ratio.sqrt() << 96;
