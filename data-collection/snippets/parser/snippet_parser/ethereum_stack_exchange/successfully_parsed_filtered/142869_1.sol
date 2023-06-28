    function getPrice() public view returns(uint256) {
        IPoolAddressesProvider provider = IPoolAddressesProvider(address(0xc4dCB5126a3AfEd129BC3668Ea19285A9f56D15D));
        address priceOracleAddress = provider.getPriceOracle();
        IPriceOracleGetter priceOracle = IPriceOracleGetter(priceOracleAddress);

        
        address daiAddress = address(0x07C725d58437504CA5f814AE406e70E21C5e8e9e); 
        uint256 price = priceOracle.getAssetPrice(daiAddress);
        
        return price;
    }
