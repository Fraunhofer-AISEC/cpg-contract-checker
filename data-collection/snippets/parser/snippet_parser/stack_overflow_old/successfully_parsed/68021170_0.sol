    function deposit() payable public {
        require(msg.value > 0, "You need to send some Ether");
    }
