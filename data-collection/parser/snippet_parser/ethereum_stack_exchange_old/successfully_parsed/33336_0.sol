contract Wallet {
    struct TokenInfo {
        IERC20Token token;
        uint exist;
    }

    mapping(address=>TokenInfo[]) public tokenList;

    function Wallet() {

    }

    function addToken(address _account, IERC20Token _token) public {
        for (uint i = 0; i < tokenList[_account].length; i++) {
            if (tokenList[_account][i].exist == 0) {
                var tokenInfo = TokenInfo(_token, 1);
                tokenList[_account].push(tokenInfo);
            }
        }
    }

    function getTokenListLength(address _account) public constant returns (uint) {
        return tokenList[_account].length;
    }
}
