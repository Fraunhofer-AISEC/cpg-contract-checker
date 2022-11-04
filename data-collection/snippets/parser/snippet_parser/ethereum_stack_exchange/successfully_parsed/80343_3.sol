contract Comptroller is ComptrollerV2Storage, ComptrollerInterface, ComptrollerErrorReporter, Exponential {

function enterMarkets(address[] memory cTokens) public returns (uint[] memory) {
    uint len = cTokens.length;

    uint[] memory results = new uint[](len);
    for (uint i = 0; i < len; i++) {
        CToken cToken = CToken(cTokens[i]);

        results[i] = uint(addToMarketInternal(cToken, msg.sender));
    }

    return results;
}
}
