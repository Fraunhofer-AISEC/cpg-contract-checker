struct Goal {
        address payable charityAddress;
        string status;
        uint amountNeeded;
        uint amountRaised;
        uint amountWithdrawn;
        uint balance;
        string proof;
        address verifier;
    }

function withdraw(uint _goalID, uint _amount) payable public {
        if (bytes(goals[_goalID].status).length != bytes("verified").length) {
            emit DonationAction(msg.sender, _amount, "unverified");
            return;
        } else if ((_amount * 1000000000000000000) > goals[_goalID].balance) {
            emit DonationAction(msg.sender, _amount, "insufficient balance");
            return;
        }

        goals[_goalID].balance = goals[_goalID].balance - _amount;

        goals[_goalID].charityAddress.transfer(address(this).balance);
        goals[_goalID].amountWithdrawn = goals[_goalID].amountWithdrawn + _amount;

        emit DonationAction(msg.sender, address(this).balance, "withdrawn");
    }
