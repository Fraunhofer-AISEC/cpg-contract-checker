function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }
