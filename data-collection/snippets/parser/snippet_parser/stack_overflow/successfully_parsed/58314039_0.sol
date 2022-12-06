function FindSpotinArray(uint256 price,
    uint256 divisionVariable, 
    uint256[] priceArray) returns (uint256) {
    if(price < priceArray[x] && priceArray != priceArray[x]) {
        divisionVariable * 2;
        var x = priceArray / divisionVariable;
    } else if (price > priceArray[x] && priceArray != priceArray[x]) {
        divisionVariable / 2;
        var x = priceArray / divisionVariable;
    } else if (price == priceArray[x]) {
        return x;
    } else if (priceArray[x - 1] <= priceArray[x] <= priceArray[x + 1]) {
        return x;
    }
}
