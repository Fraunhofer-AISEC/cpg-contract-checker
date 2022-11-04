  pragma solidity ^0.8;

contract MyContract {
    uint256 constant FUNDING_GOAL = 1 ether;
    address constant TEAM_ADDRESS = address(0x123);

    
    function withdraw() external {
        require(address(this).balance >= FUNDING_GOAL, 'Haven\'t reached the funding goal');
        payable(TEAM_ADDRESS).transfer(address(this).balance);
    }
    
    
    receive() external payable {}
}
