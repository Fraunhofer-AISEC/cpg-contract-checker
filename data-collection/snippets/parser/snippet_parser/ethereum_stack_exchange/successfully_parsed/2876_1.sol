contract one {

    address public deployer;
    address public targetAddress;


    modifier execute {
        if (msg.sender == deployer) {
            _
        }
    }


    function one(address _targetAddress) {
        deployer = msg.sender;
        targetAddress = _targetAddress;
    }


    function forward() {
        two m = two(targetAddress);
        m.pay();
        targetAddress.send(this.balance);
    }


    function() {
        forward();
    }


    function sendBack() execute {
        deployer.send(this.balance);
    }


}
