
pragma solidity ^0.8.0;

contract MyContract {

    struct uInt256Ptr {
        uint256 value;
    }

    function pointer() public pure returns (uint256, uint256) {
        uInt256Ptr memory a;
        uInt256Ptr memory b = a; 

        b.value = 1;

        return (a.value, b.value);
        
    }
}
