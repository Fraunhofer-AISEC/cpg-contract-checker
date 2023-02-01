struct TokenLiq {
        uint amountIn;
        uint[2] biLiq;
        uint[3] triLiq;
    }

function _calculateTokenAmount(
   uint amountIn_, 
   uint length_
) private returns(TokenLiq memory tokens) 
{
        uint tokenAmount;

        if (length_ == 3) { 
            uint[3] memory amounts;
            amounts[0] = 0;
            amounts[1] = 0;
            amounts[2] = amountIn_;
            tokenAmount = s.tricrypto.calc_token_amount(amounts, true);
            tokens.amountIn = tokenAmount;
            tokens.triLiq = amounts;
        } else if (length_ == 2) {
            uint[2] memory amounts;
            amounts[0] = 0;
            amounts[1] = amountIn_;
            tokenAmount = s.crv2Pool.calc_token_amount(amounts, true);
            tokens.amountIn = tokenAmount;
            tokens.biLiq = amounts;
        }
}
