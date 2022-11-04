contract Funder{
    uint public numOfFunders;

    mapping(uint256 => address) private funders;

    receive() external payable {}

    function transfer() external payable {
        funders[numOfFunders] = msg.sender;
    }

    function withdraw(uint withdrawAmount) external{
        require(withdrawAmount <= 2 ether,"cannot withdraw more than 2 ether");
        payable(msg.sender).transfer(withdrawAmount);
    }
}
