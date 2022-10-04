c.numFunders++;
Funder storage f = c.funders[c.numFunders];
f.addr = msg.sender;
f.amount = 100;
