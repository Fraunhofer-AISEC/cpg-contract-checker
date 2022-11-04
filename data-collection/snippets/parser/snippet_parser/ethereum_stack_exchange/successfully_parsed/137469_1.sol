uint balanceBeforeTx = (_gasleft + X) * tx.gasprice + msg.value + address(msg.sender).balance;
