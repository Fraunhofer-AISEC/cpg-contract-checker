pragma solidity ^0.4.6;

contract Project {

    struct projectInfo {
        address projectOwner;
        string name;
        uint256 amountToRaise;
        uint256 deadline;
    }

    projectInfo public info;
    uint256 public amountRaised;
    bool public ended;
    bool public refundEnabled;
    mapping(address => uint256) public contributions;

    function Project(string name, uint256 amountToRaise, uint256 deadline) {
        info = projectInfo(tx.origin, name, amountToRaise, deadline);
        amountRaised = 0;
        ended = false;
        refundEnabled = false;
    }

    function getInfo() constant returns (address, string, uint256, uint256) {
        return (info.projectOwner, info.name, info.amountToRaise, info.deadline);
    }

    function fund() payable returns (bool successful) {
        if (ended) {
            return false;
        }
        contributions[tx.origin] += msg.value;
        amountRaised += msg.value;
        if (now > info.deadline) {
            ended = true;
            refundEnabled = true;
            return false;
        }
        if (amountRaised >= info.amountToRaise) {
            ended = true;
            payout();
        }
        return true;
    }

    function payout() private returns (bool successful) {
        if (ended) {
            if (!info.projectOwner.send(this.balance)) {
                throw;
            }
        }
    }

    function refund() public returns (bool successful) {
        if (refundEnabled) {
            if (contributions[msg.sender] > 0) {
                if (msg.sender.send(contributions[msg.sender])) {
                    contributions[msg.sender] = 0;
                    return true;
                } else {
                    return false;
                }
            } else {
                throw;
            }
        }
    }
}
