
pragma solidity ^0.8.0;

contract Math {

    mapping(uint256 => uint256) nums;
    uint256 len = 0;

    function fpowWrite(
        uint256 x,
        uint256 n,
        uint256 baseUnit
    ) public returns (uint256 z) {
        assembly {
                ...
                
                let half := shr(1, baseUnit)
                let count := 0 
                for {
                    
                    n := shr(1, n)
                } n {
                    
                    n := shr(1, n)
                } {
                    ...

                        
                        z := div(zxRound, baseUnit)

                        
                        sstore(count, z)
                        sstore(add(count, 1), add(count, 1))
                        count := add(count, 2)
                    }
                }
            }
        }
    }

    function getValues() public view returns(uint256[] memory) {
        uint256[] memory _nums;
        for(uint256 i = 0; i < len; i++) {
            _nums[i] = nums[i];
        }
        return (_nums);
    }

    function getLen() public view returns (uint256) {
        return (len);
    }
}```
