    uint[] payees = [1, 2, 3, 4, 5];

    function removePayee(uint256 index) external {
        if (index >= payees.length) return;

        for (uint i = index; i<payees.length-1; i++){
            payees[i] = payees[i+1];
        }
        payees.pop();
    }
