  function () payable { 
    if (!TokenSalesInterface(tokenSales).proxyPurchase(msg.sender)) throw;
  }
