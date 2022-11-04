pragma solidity >=0.5.0 <0.6.0;

contract ContractA {
    uint256 public count;

    constructor(uint256 init) public {
        count = init;
    }

    function add(uint256 val) public returns(uint256) {
        require(val > 0);
        count = count + val;

        return count;
    }
}

