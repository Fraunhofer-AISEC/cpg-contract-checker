

pragma solidity >=0.7.0 <0.9.0;



contract LotteryFactory {
    Lottery[] public deployedLotteries;

    function createLottery(uint256 minimum) public {
        Lottery newLottery = new Lottery(minimum, msg.sender);
        deployedLotteries.push(newLottery);
    }

    function getDeployedLotteries() public view returns (Lottery[] memory) {
        return deployedLotteries;
    }
}

contract Lottery {...}
