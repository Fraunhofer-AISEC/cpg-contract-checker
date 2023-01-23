function myFlashLoanCall() public returns (bool){
        address receiverAddress = address(this);

        address[] memory assets = new address[](2);
        assets[0] = address(0x7f27352D5F83Db87a5A3E00f4B07Cc2138D8ee52);
        assets[1] = address(0x3795C36e7D12A8c252A20C5a7B455f7c57b60283);

        uint256[] memory amounts = new uint256[](2);
        amounts[0] = 0 ether;
        amounts[1] = 0.0001 ether;

        
        uint256[] memory modes = new uint256[](2);
        modes[0] = 0;
        modes[1] = 0;

        address onBehalfOf = address(this);
        bytes memory params = "";
        uint16 referralCode = 0;

        LENDING_POOL.flashLoan(
            receiverAddress,
            assets,
            amounts,
            modes,
            onBehalfOf,
            params,
            referralCode
        );
        return true;
    }
