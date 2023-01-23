pragam solidity >=0.8.0;

import { Foo } from "/path/to/Foo.sol";

contract Bar {
    function myFunction() external {
        uint256 myConstant = Foo.MY_CONSTANT; 
    }
}
