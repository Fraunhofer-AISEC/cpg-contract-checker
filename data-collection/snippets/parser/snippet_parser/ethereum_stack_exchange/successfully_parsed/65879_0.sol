function buyLoan(Loan _sellLoan, Portfolio _sellPortfolio, uint _tradePrice) public {

            uint tradePrice = _tradePrice;

            
            Portfolio sp = _sellPortfolio;

            
            address(sp).transfer(tradePrice);    

            
            _sellLoan.setPrice(tradePrice);
            loans.push(Loan(_sellLoan)) -1;
            portfolioLoanBalance += _sellLoan.getBalance();

            
            portfolioLoanStatus[address(_sellLoan)] = 0x41;

            
            sp.setLoanStatus(_sellLoan, 0x53);

        } 
