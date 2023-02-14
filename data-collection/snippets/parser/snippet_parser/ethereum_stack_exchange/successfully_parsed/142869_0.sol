pragma solidity ^0.8.0;

import "https://github.com/aave/aave-v3-core/blob/master/contracts/interfaces/IPriceOracleGetter.sol";
import "https://github.com/aave/aave-v3-core/blob/master/contracts/interfaces/IPoolAddressesProvider.sol";

contract Flash {

    event print_value(uint256 indexed value1);

    function getPrice() public view returns(uint256) {
        IPoolAddressesProvider provider = IPoolAddressesProvider(address(0xC87385b5E62099f92d490750Fcd6C901a524BBcA));
        address priceOracleAddress = provider.getPriceOracle();
        IPriceOracleGetter priceOracle = IPriceOracleGetter(priceOracleAddress);

        address daiAddress = address(0x6A639d29454287B3cBB632Aa9f93bfB89E3fd18f); 
        uint256 price = priceOracle.getAssetPrice(daiAddress);
        
        return price;
    }

} 
