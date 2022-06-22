function buyTokenByTokenWithPermission(
address _beneficiary,
address _token,
uint256 _amount,
address _candidate,
uint256 _maxAmount,
uint256 _minAmount,
bytes memory _signature
) public whenNotPaused nonReentrant {
require(offeredCurrencies[_token].rate != 0, "POOL::PURCHASE_METHOD_NOT_ALLOWED");
require(_validPurchase(), "POOL::ENDED");
require(_verifyWhitelist(_candidate, _maxAmount, _minAmount, _signature), "POOL:INVALID_SIGNATURE");

_preValidatePurchase(_beneficiary, _amount);

uint256 tokens = _getOfferedCurrencyToTokenAmount(_token, _amount);
require(getAvailableTokensForSale() >= tokens, "POOL::NOT_ENOUGHT_TOKENS_FOR_SALE");
require(tokens >= _minAmount || userPurchased[_candidate].add(tokens) >= _minAmount, "POOL::MIN_AMOUNT_UNREACHED");
require(userPurchased[_candidate].add(tokens) <= _maxAmount, "POOL:PURCHASE_AMOUNT_EXCEED_ALLOWANCE");

_forwardTokenFunds(_token, _amount);

_updatePurchasingState(_amount, tokens);

investedAmountOf[_token][_candidate] = investedAmountOf[address(0)][_candidate].add(_amount);

emit TokenPurchaseByToken(
msg.sender,
_beneficiary,
_token,
_amount,
tokens
);
}
