function confirmAmount(uint amount) driverOnly inState(State.FINDING_DRIVER) public returns (bool ) {
        if(amount < 0) {
            amount = 20;
        }
