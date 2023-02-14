struct delegation{
    uint256 percent;
    address delegator;
}

struct checkpoint{
    uint256 blockNumber;
    uint256 balance;
    delegation[] delegationTable;
}

mapping(address => delegation[]) votePower;
mapping(address => uint256) balance;
mapping(address => checkpoint[]) checkpoints;

function _setCheckpoint(address _who) private{
        checkpoints[_who].push(
            checkpoint(
                uint256(block.number),
                balance[_who],
                votePower[_who]                 
            )
        );
}
