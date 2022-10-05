function buyLoan(address _sellLoan, address _sellPortfolio) public {

    uint tradePrice = Loan(_sellLoan).getBalance();

    
    if (tradePrice > address(this).balance) {
        
        revert();
    } else {
        

        
        Portfolio sp = Portfolio(_sellPortfolio);

        
        tr.executeTrade(_sellLoan, _tradeDate);

      if (!address(sp).send(tradePrice))
            revert();

        
        addLoan(_sellLoan, tradePrice);

        
        sp.deleteLoan(_sellLoan);
        }

}
