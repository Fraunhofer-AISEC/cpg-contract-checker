function sqrt(uint x) returns (uint y) {
    uint z = (x + 1) / 2;
    y = x;
    while (z < y) {
        y = z;
        z = (x / z + z) / 2;
    }
}

function foo() {
    
    
    uint a = (sqrt((pn*x*y)/pd)*pd)/pn - x;

    
    uint inputAmount = (sqrt((priceNumerator * inputReserve * outputReserve) / priceDenominator) * priceDenominator) / priceNumerator - inputReserve;
}
