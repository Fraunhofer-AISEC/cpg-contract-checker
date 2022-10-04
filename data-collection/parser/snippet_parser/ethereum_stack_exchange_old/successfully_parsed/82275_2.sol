address payable wallet = address(uint160(address(this)));
wallet.transfer(msg.value);
