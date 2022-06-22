address ndAddress;

    modifier onlyND() {
        require(msg.sender == ndAddress);
        _;
    }

    function purchase() onlyND public {
        
    }
