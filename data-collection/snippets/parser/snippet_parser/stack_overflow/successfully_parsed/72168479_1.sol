    function fun(uint _value) public pure returns(string memory)
    {
        string memory _return;
        _value > 100 ? _return = "Greater than 100" : _value < 100 ? _return = "Lower than 100" : _return = "Equal to 100";

        return _return;
    }

