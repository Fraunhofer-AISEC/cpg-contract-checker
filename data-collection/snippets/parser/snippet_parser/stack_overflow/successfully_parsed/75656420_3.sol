import "./IToken.sol";

contract Test { IToken public token; IERC20 public usdt = IERC20(0x337610d27c682E347C9cD60BD4b3b107C9d34dDd);

constructor(address _token) { token = IToken(_token);
    }

function sell(uint256 amount, address recipient) external { token.sell(amount, recipient);
    }

function buy(uint256 numTokens) external { usdt.transferFrom(msg.sender, address(this), numTokens); usdt.approve(address(token), numTokens); token.buy(numTokens);
    } }
