function removePayee(
        uint256 index
    ) internal {
        if (index >= payees.length) return;

        for (uint i = index; i<payees.length-1; i++){
            payees[i] = payees[i+1];
        }
        delete payees[payees.length-1];
        payees.length--;
    }
