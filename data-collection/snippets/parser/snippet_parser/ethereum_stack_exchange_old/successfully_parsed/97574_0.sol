   function unknownfunction(address varg0, uint256 varg1) public payable { 
        v0 = new bytes[](varg1.length);
        v1 = msg.data.length;
        CALLDATACOPY(v0.data, 36 + varg1, varg1.length);
        require(msg.sender == _owner);
        v2 = v3 = 0;
        while (v2 < v0.length) {
            MEM[v2 + v4.data] = MEM[v2 + v0.data];
            v2 += 32;
        }
        v5 = v6 = v0.length + v4.data;
        if (0x1f & v0.length) {
            MEM[v6 - (0x1f & v0.length)] = ~(256 ** (32 - (0x1f & v0.length)) - 1) & MEM[v6 - (0x1f & v0.length)];
        }
        v7 = varg0.call(v4.data).value(msg.value).gas(msg.gas);
        require(v7);
    }
