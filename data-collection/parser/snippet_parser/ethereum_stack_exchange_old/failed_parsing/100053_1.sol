Bond storage newBond = BondLedger[msg.sender].push();

newBond.deposit_value = msg.value;
newBond.creationblock = block.number;
newBond.redemptionblock = block.number + 100;
