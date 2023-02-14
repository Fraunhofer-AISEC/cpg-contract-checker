
    function transferFrom(address from, address to, uint value) external returns (bool) {
        address _msgSender = msg.sender;
        if (allowance[from][_msgSender] != uint(-1)) {
            allowance[from][_msgSender] = allowance[from][_msgSender].sub(value);
        }
        _transfer(from, to, value);
        return true;
    }

