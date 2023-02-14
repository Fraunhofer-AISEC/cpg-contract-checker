
    
pragma solidity >=0.4.22 <0.9.0;


import "remix_tests.sol"; 




import "remix_accounts.sol";
import "./Bet.sol";


contract testSuite {
    
    
    Bet bet = new Bet( 0x92154D3Ca6b7E34aC0F824c42a7cC18A495cabaB,
        0x92154D3Ca6b7E34aC0F824c42a7cC18A495cabaB,
        0x92154D3Ca6b7E34aC0F824c42a7cC18A495cabaB,
        0x92154D3Ca6b7E34aC0F824c42a7cC18A495cabaB,
        0x92154D3Ca6b7E34aC0F824c42a7cC18A495cabaB,
        0x92154D3Ca6b7E34aC0F824c42a7cC18A495cabaB
        );

    function beforeAll() public {
        Assert.equal(bet.totalSupply(), 250000000 * 10 ** 8, "Total supply should be 250 million");
    }

    function checkFailure() public {
        Assert.notEqual(bet.totalSupply(), 250000000 * 10 ** 7, "Total supply should not be 250 thousand");
    }
}
