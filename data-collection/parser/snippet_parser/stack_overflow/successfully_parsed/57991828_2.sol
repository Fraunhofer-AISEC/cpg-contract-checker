 function enterFunds(uint amount) public payable {
        require(msg.value == amount);
        emit operations("Ingreso realizado de: ", amount);


    }
