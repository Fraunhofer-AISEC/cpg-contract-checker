uint gas_remaining = msg.gas;

refund = refund + ((gas_remaining - msg.gas) * tx.gasprice);
