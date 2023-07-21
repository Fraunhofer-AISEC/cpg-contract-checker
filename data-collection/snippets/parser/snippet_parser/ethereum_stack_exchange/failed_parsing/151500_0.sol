contract parentContract {    
    constructor(address _param1) {
        param1 = _param1
    }

    function parentFunction() {
        ...
    }
}

contract childContract is Initializable, parentContract {   
    constructor() {
        _disableInitializers();
    }

    function initialize() {
        admin = msg.sender
    }
}

