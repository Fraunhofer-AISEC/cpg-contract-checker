
    modifier requiresFee(uint fee) {
        require(msg.value == fee);
        _ ;
    }

    function simple() requiresFee(0.02 ether) payable external {

      owner.call.value(0.02 ether).gas(20317)("");

     

    }

