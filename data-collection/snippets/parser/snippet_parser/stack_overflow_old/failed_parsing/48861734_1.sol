    contract.nextState.estimateGas(function(error, result) {
        if (!error) {
            contract.nextState(function(error, result) {
                if (!error) {
                    alert("This is my value: " + result);
                } else {
                    if (error.message.indexOf("User denied") != -1) {
                        alert("You rejected the transaction on Metamask!");
                    } else {
                        alert(error);
                    }
                }
            });
        } else {
            alert("This function cannot be run at this time.");
        }
    });
