    function fpowSol(
        uint256 x,
        uint256 n,
        uint256 baseUnit
    ) public pure returns (uint256 z) {
        if(x == 0) {
            if(n == 0) {
                return (baseUnit);
            } else {
                return (0);
            }
        }

        if(n % 2 == 0) {
            z = baseUnit;
        } else {
            z = x;
        }

        uint256 half = baseUnit >> 1;

        for(n >>= 1; n > 0; n >>= 1) {
            uint256 xx = x * x;
            if(xx / x != x) { require(false, "xx overvlowed"); }

            uint256 xxRound = xx + half;
            if(xxRound < xx) { require(false, "xxRound overflowed"); }

            x = xxRound / baseUnit;

            if(n % 2 != 0) { 
                uint256 zx = z * x;
                require(zx / x == z, "zx overflowed");

                uint256 zxRound = zx + half;
                if(zxRound < zx) { require(false, "zxRound overflowed"); }

                z = zxRound / baseUnit;
            }
        }
        return (z);
    }
