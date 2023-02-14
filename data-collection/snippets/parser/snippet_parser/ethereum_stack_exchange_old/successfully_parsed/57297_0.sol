pragma solidity ^0.4.1;

contract sample_call {
    function call() public pure {
        uint a;
        sample v;   

        a = v.add_var(0x22); 
    }
}

contract sample {
    function add_var(uint a) public pure returns(uint) {
    return a + 0x55;
    }
}
