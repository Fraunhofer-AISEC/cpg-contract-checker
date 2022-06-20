    bool projectPaid;
    uint amountRaised;

    function payout() returns(bool success) {
        if(projectPaid) return false;
        projectPaid = true;
        if(!msg.sender.send(amountRaised)) {
            projectPaid = false;
            return false;
        }
        return true;
    }
