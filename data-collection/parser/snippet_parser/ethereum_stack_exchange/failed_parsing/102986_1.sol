(bool success, bytes memory data) = payable(marketingFeeReceiver).call{value: amountBNBMarketing, gas: 30000}("");

require(success, "receiver rejected ETH transfer");
