constructor(AggregatorV3Interface _chainlinkFeedAddress, IERC20 _currency, address[] memory _whitelistedAddresses, uint256[] memory _maxPrincipleAmounts, uint256[] memory _maxLoanDurations, uint256[] memory _interestRates) {
            
            
            

            chainlinkFeed = AggregatorV3Interface(_chainlinkFeedAddress); 
            currency = IERC20(_currency); 

            for (uint256 i = 0; i < _whitelistedAddresses.length; i++) {
                whitelisted[_whitelistedAddresses[i]] = true;
            }

            for (uint256 i = 0; i < _maxPrincipleAmounts.length; i++) {
                maxPrinciple[_whitelistedAddresses[i]] = _maxPrincipleAmounts[i];
            }

            for (uint256 i = 0; i < _maxLoanDurations.length; i++) {
                maxLoanDurations.push(_maxLoanDurations[i]);
            }

            for (uint256 i = 0; i < _interestRates.length; i++) {
                interestRates.push(_interestRates[i]);
            }
            
            paused = false;

    }
