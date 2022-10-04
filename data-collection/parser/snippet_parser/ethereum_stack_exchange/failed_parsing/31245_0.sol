function factorization(uint256 compositeNumber, uint256 limit) constant returns(uint256 pp){
    uint256 g = compositeNumber;
    uint256 x1 = 16;
    uint256 y1 = 5;
    uint256 z1 = 1;
    while (g == compositeNumber){
        g = greatestCommonDivisor(4 * a**3 + 27 * b**2, compositeNumber);
    }
    if (g > 1){
        return g;
    }
    for(uint256 i = 1; i <= limit; i++){ 
        if (i in prime(limit)){          
        pp = i;
        while (pp < limit){
            (x1, y1, z1) = _ecMul(i, x1, y1, z1);
            if (z1 > 1){
                return greatestCommonDivisor(z1, compositeNumber);
            }
            pp = i * pp;
        }
        }
    }
}

function prime(uint256 limit) constant returns(uint256[] memory primes){
    primes = new uint256[](limit +1);
    for (uint256 i = 2; i < limit; i++){
        primes[i] = i;
    } 
    i = 2;
    while(i**2 <= limit){
        if (primes[i] != 0){
            for (uint256 j = 2; j < limit; j++){
                if (primes[i] * j > limit){
                    break;
                }
                else {
                    primes[primes[i] * j] = 0;
                }
            }
        }
        i++;
    }
    for (i = 2; i <= limit; i++){
        if (primes[i] != 0){
            primes[i];
        }
    }
}
