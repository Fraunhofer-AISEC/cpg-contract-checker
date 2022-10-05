contract Handcuffs {
    address left;
    address right;

    
    function set() {
        if (left == 0x0)
            left = msg.sender;
        else if (right == 0x0)
            right = msg.sender;
        else
            throw;
    }

    
    function get() constant returns (address partner) {
        if (msg.sender == left && right != 0)
            return right;
        else if (msg.sender == right && left != 0)
            return left;
        else
            throw;
    }
}

contract Allower {
    Handcuffs allowed;

    function Allower(Handcuffs _allowed) {
        allowed = _allowed;
        allowed.set();
    }

    function doSth() onlyallowed;

    modifier onlyallowed {
        if (msg.sender != allowed.get())
            throw;
        _
    }
}

contract Allowed {
    Handcuffs allower;

    function Allowed (Handcuffs _allower) {
        allower = _allower;
        allower.set();
    }

    function doSthOnAllower() {
        var allowerContract = Allower(allower.get());
        allowerContract.doSth();
    }
}
