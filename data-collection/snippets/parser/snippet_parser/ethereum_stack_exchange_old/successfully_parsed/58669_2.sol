pragma solidity ^0.4.24;

contract Coupons {
    uint256 public totalSupply;
    uint256 public amountAvailable;
    mapping(address => uint256) public amountReserved;

    function issue(uint256 howMany) external {
        
        require(totalSupply + howMany >= totalSupply);

        totalSupply += howMany;
        amountAvailable += howMany;
    }

    function reserve(uint256 howMany) external {
        require(amountAvailable >= howMany);

        amountReserved[msg.sender] += howMany;
        amountAvailable -= howMany;
    }

    function stateOf(uint256 which) external view returns (bool) {
        return which <= totalSupply - amountAvailable;
    }
}
