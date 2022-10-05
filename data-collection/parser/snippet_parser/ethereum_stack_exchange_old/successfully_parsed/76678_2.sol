pragma solidity 0.5.2;

contract BurnEth {

    function burnEth() public payable {
        address(0).transfer(msg.value);
    }
}
