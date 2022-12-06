contract Allower {
    Allowed allowed;

    function doSth() onlyallowed;

    modifier onlyallowed {
        if (msg.sender != address(allowed))
            throw;
        _
    }
}

contract Allowed {
    Allower allower;

    function doSthOnAllower() {
        allower.doSth();
    }
}
