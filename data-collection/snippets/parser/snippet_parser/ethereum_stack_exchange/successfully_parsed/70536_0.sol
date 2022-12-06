pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

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
    for(uint i=0; i<_array.length; i++){
      priceByCurrencyType[_array[0].currencyInt].price=_array[i].price;
    }
  }
}
