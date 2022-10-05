pragma solidity >=0.8.0;

contract HToken is Erc20Recover {
    constructor(underlying) {
        IErc20[1] memory nonRecoverableTokens = [underlying];
        _setNonRecoverableTokens(nonRecoverableTokens);
    }
}
