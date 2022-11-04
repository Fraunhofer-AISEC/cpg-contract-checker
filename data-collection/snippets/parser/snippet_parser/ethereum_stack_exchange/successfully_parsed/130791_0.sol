 function createNewPairing(address tokenA, address tokenB)
        external
        returns (address pair)
    {
        
        checkTokens(tokenA, tokenB);

        

    }
 function checkTokens(address tokenA, address tokenB) internal pure {
        if (tokenA == address(0)) {
            revert WinDex__ZeroAddress(tokenA);
        }
        if (tokenB == address(0)) {
            revert WinDex__ZeroAddress(tokenB);
        }
        if (tokenA == tokenB) {
            revert WinDex__IdenticalAddress(tokenA, tokenB);
        }
    }
