pragma solidity 0.5.2;

contract Test {
    uint256[] foo;
    uint256[] bar;

    constructor() public {
       for (uint256 i = 0; i < 5; i++) { 
           foo.push(i);
       }
       for (uint256 i = 0; i < 100; i++) {
           bar.push(i);
       }
    }

    function deleteFoo() external {
        foo.length =  0;
    }

    function deleteBar() external {
        bar.length = 0;
    }
}
