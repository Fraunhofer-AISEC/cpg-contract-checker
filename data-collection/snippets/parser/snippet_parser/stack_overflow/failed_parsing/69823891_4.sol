event Error(string _message);

function withdraw(uint wdraw_amt) public {
    if (wdraw_amt <= balance) {
        balance -= wdraw_amt;
    } else {
        emit Error("Insufficient Balance");
    }
}
