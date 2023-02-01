function safeBatchReleaseCollaterals(
        uint256[] memory bondIds,
        uint256[] memory collateralIds,
        address to
    ) public {
        
        uint256 lastAuthorizedBond = 2**256 - 1;
        uint256 lastCurrencyRef = 2**256 - 1;
        Currency storage currency;
        for (uint256 i = 0; i < bondIds.length; i++) {
            uint256 bondId = bondIds[i];
            
            if (lastAuthorizedBond != bondId) {
                require( 
                    _isAuthorizedToReleaseCollateral(bondId, msg.sender),
                    "CollateralManager: unauthorized to release collateral"
                );
                lastAuthorizedBond = bondId;
            }
            uint256 collateralId = collateralIds[i];
            Collateral storage c = collateral[bondId][collateralId];
            
            if (lastCurrencyRef != c.currencyRef) {
                currency = currencies[c.currencyRef]; 
                lastCurrencyRef = c.currencyRef;
            }
            _transferGenericCurrency(currency, address(this), to, c.amountOrId, "");
            emit CollateralReleased(bondId, collateralId, to);
        }
    }
