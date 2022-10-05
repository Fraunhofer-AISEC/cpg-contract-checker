pragma solidity >=0.4.22 <0.7.0;

contract Test {

    address payable[] public contributors;

    constructor() public {}

    function bulkSend(uint256 amount) public payable {
        uint256 share = amount / contributors.length;
        uint256 length = contributors.length;
        uint256 currentSum = 0;
        for (uint256 i = 0; i < length; i++) {
            require(share > 0);
            currentSum += share;
            require(currentSum <= msg.value);
            contributors[i].transfer(share);
        }
        require(currentSum == msg.value);
    }

    function contribute() public payable {
        contributors.push(msg.sender);
        bulkSend(msg.value);
    }
}
