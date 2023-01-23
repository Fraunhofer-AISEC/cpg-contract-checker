    uint256 constant public OFFER_LIMIT = 500 ether;


         function buyTheObjective(address _customer, uint256 _offer) internal returns (uint256) {
                require(limitRemovalDate > 0, "[!] Sale has expired" );

                
                
                
                if (now < limitRemovalDate && _offer > OFFER_LIMIT) {

                    
                    
                    
                }
}