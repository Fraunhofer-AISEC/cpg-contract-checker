function transferTokens(bytes32 symbol_, address to_, uint256 amount_) public whenNotPaused {
    require(tokens[symbol_] != 0x0);
    require(amount_ > 0);

    address contract_ = tokens[symbol_];
    address from_ = msg.sender;

    ERC20Interface = ERC20(contract_); 

    uint256 transactionId = transactions.push(
        Transfer({
            contract_:  contract_,
            to_: to_,
            amount_: amount_,
            failed_: true
        })
    );

    transactionIndexesToSender[from_].push(transactionId - 1);

    if(amount_ > ERC20Interface.allowance(from_, address(this))) { 
        
        emit TransferFailed(from_, to_, amount_);
        revert();
    }

    ERC20Interface.transferFrom(from_, to_, amount_);

    transactions[transactionId - 1].failed_ = false;

    emit TransferSuccessful(from_, to_, amount_);
}
