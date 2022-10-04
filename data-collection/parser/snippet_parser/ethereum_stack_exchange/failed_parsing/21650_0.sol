browser/TokenSales.sol:18:10: Error: Member "value" not found or not visible after argument-dependent lookup in function (address) external returns (bool) - did you forget the "payable" modifier?
    if (!TokenSalesInterface(tokenSales).proxyPurchase.value(msg.value).gas(106000)(payout)) throw;
         ^-------------------------------------------------^
