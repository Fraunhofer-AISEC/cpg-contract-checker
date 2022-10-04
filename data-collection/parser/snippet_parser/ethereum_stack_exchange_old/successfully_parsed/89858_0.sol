function trxToTokenOutput(uint256 tokens_bought, uint256 max_trx, uint256 deadline, address payable buyer, address recipient) private nonReentrant returns (uint256) {
    require(deadline >= block.timestamp && tokens_bought > 0 && max_trx > 0);
    uint256 token_reserve = token.balanceOf(address(this));
    uint256 trx_sold = getOutputPrice(tokens_bought, address(this).balance.sub(max_trx), token_reserve);
    
    uint256 trx_refund = max_trx.sub(trx_sold);
    if (trx_refund > 0) {
      buyer.transfer(trx_refund);
    }
    require(address(token).safeTransfer(recipient,tokens_bought));
    emit TokenPurchase(buyer, trx_sold, tokens_bought);
    emit Snapshot(buyer,address(this).balance,token.balanceOf(address(this)));
    return trx_sold;
  }

function trxToTokenSwapOutput(uint256 tokens_bought, uint256 deadline) public payable returns(uint256) {
    return trxToTokenOutput(tokens_bought, msg.value, deadline, msg.sender, msg.sender);
  }



function _sellTrxForFixedToken(uint _tokens_bought, uint _deadline) private returns (uint) {
        return exchangeToken.trxToTokenSwapOutput(_tokens_bought, _deadline);
    }
