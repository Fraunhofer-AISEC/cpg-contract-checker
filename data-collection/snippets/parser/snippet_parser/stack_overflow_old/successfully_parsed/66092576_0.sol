function swapOnOneInch(
    address fromToken,
    address toToken,
    uint256 originAmount,
    uint256 minTargetAmount,
    uint256[] memory exchangeDistribution
    ) internal {
    uint minOut = 99 * minTargetAmount / 100;
    bytes memory _data = abi.encodeWithSignature(
      "swap(address,address,uint256,uint256,uint256[],uint256)",
      fromToken,
      toToken,
      originAmount,
      
      
      minOut,
      exchangeDistribution,
      0
    );
    invoke(0x50FDA034C0Ce7a8f7EFDAebDA7Aa7cA21CC1267e, _data);
}
