function createBorrowerCentricService (address _borrowToken) public returns (uint256) {
        BorrowService storage borrowService = borrowingServices[numberOfBorrowingServices];

        ++numberOfBorrowingServices;

        borrowService.lenderAddress = msg.sender;
        borrowService.borrowToken = _borrowToken;

        if (borrowService.borrowToken != 0x0000000000000000000000000000000000000000) {
            borrowService.lenderBalance = IERC20(_borrowToken).balanceOf(msg.sender);
        } else {
            borrowService.lenderBalance = (msg.sender).balance;
        }
        
        borrowService.borrowAmount = 0;
        borrowService.nftCollateral = 0x0000000000000000000000000000000000000000;
        borrowService.borrowPeriod = 0;
        borrowService.serviceID = numberOfBorrowingServices - 1;
     
        return numberOfBorrowingServices - 1;

    }

