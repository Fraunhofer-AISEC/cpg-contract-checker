contract MyContract {

    constructor(uint a, address b, bool c) public {
        _init(a, b, c);
    }

    function () public {
        _init(msg.value, msg.sender, false);
    }

    function _init(uint a, address b, bool c) private {
        
    }
}
