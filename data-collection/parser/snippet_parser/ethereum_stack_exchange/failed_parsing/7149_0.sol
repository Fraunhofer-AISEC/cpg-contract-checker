
if(tr.confirmedByUbuntu && tr.confirmedByWindows) {
    bool withdrawal = tr.to.send(tr.value); 
    if(withdrawal) {
        ConfirmedTransaction(_confirmationHash, tr.to, tr.value, tr.data);
        delete pendingTransactions[_confirmationHash];  
    } else {
        TransactionConfirmationFailed(_confirmationHash, tr.to, tr.value, tr.data);
    }
}
