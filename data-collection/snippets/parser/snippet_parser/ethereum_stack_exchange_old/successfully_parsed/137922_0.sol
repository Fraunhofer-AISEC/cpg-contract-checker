    function fpow(
        uint256 x,
        uint256 n,
        uint256 baseUnit
    ) internal pure returns (uint256 z) {
        assembly {
            switch x
            case 0 {
                switch n
                case 0 {
                    
                    z := baseUnit
                }
                default {
                    
                    z := 0
                }
            }
            default {
                switch mod(n, 2)
                case 0 {
                    
                    z := baseUnit
                }
                default {
                    
                    z := x
                }

                
                let half := shr(1, baseUnit)

                for {
                    
                    n := shr(1, n)
                } n {
                    
                    n := shr(1, n)
                } {
                    
                    
                    if shr(128, x) {
                        revert(0, 0)
                    }

                    
                    let xx := mul(x, x)

                    
                    let xxRound := add(xx, half)

                    
                    if lt(xxRound, xx) {
                        revert(0, 0)
                    }

                    
                    x := div(xxRound, baseUnit)

                    
                    if mod(n, 2) {
                        
                        let zx := mul(z, x)

                        
                        if iszero(eq(div(zx, x), z)) {
                            
                            if iszero(iszero(x)) {
                                revert(0, 0)
                            }
                        }

                        
                        let zxRound := add(zx, half)

                        
                        if lt(zxRound, zx) {
                            revert(0, 0)
                        }

                        
                        z := div(zxRound, baseUnit)
                    }
                }
            }
        }
    }
