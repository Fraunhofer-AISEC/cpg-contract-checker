pragma solidity ^0.4.24;

contract ExchangeContract {
    enum CurrencyType { USD, TWOKEY, BTC, ETH, DAI, USDT, TUSD, EUR, JPY, GBP}

    mapping(uint256 => CurrencyPrice) public priceByCurrencyType;

    struct Price{
        uint price;
        uint decimals;
    }

    struct CurrencyPrice{
        uint currencyInt;
        Price price;
    }

    function updatePrices(CurrencyPrice[] memory _array) public {
        for(i=0; i<_array.length; i++){
            priceByCurrencyType[_array[0][0]]=_array[0][1];
        }
    }
}
