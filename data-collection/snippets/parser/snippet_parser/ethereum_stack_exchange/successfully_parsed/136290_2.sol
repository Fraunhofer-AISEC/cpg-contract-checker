
pragma solidity 0.8.16;

contract Contract {

    uint256 public total;

    function get() public payable {
        total += msg.value;
    }

}

