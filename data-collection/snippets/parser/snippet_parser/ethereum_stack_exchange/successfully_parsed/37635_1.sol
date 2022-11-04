    function makePayment() onlyOwner payable public {

        received = msg.value;
        if (received >= balance){
            received    -= balance;
            amtPaid     += balance;
            balance     = 0;
        } else {
            balance     -= received;
            amtPaid     += received;
            received    = 0;
        }

    }
