uint _gasleft = gasleft();
uint balanceBeforeTx = (_gasleft + 21000 ) * tx.gasprice + block.basefee + msg.value + address(msg.sender).balance;
