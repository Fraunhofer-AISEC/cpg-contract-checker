        bool isSent = _toWhom.send(10);
        require (isSent, "Sending funds unsuccessfull");
    }
