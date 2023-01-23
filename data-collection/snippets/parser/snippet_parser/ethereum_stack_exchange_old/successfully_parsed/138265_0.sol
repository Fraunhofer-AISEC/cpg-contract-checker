    function liquidateBorrow(address borrower, CToken cTokenCollateral) external payable {
        liquidateBorrowInternal(borrower, msg.value, cTokenCollateral);
    }
