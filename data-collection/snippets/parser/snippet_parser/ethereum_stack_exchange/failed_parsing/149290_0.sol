contract MyContract {
    struct Balance {
        uint numDeposit;
        mapping(address=> uint) public Deposit; 
        uint numWithdraw;
        mapping(address=> uint) Withdraw;
    }   
}
