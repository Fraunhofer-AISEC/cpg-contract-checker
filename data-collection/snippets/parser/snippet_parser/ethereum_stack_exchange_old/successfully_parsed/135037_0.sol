
pragma solidity ^0.8.0;

contract Counter {

    mapping(address => uint256) public balances;

    constructor() {
        balances[msg.sender] = 0;
    }

    function underflow_assembly() public pure returns(uint256) {
        uint256 n = 0;
        assembly {
            n := sub(n, 1)
        }
        
        return n;
    }

    function underflow_unchecked() public pure returns(uint256) {
        uint256 n = 0;
        unchecked {
            n--;
        }
        
        return n;
    }

    
    function no_underflow() public pure returns(uint256) {
        uint256 n = 0;
        n--;
        return n;
    }

    
    function balanceUnderflow() public {
        balances[msg.sender] -= 1;
    }

}

