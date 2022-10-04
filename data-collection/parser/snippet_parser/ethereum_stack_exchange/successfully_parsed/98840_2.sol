contract TestModifier {

    string[] public messages;
    uint256 testVariable;

    function numberOfMessages() constant returns (uint256) {
        return messages.length;
    }

    modifier checkOne {
        messages.push("checkOne - 1");
        if (testVariable == 123) 
            throw;
        _
        messages.push("checkOne - 2");
        if (testVariable == 123) 
            throw;
    }

    modifier checkTwo {
        messages.push("checkTwo - 1");
        if (testVariable == 123) 
            throw;
        _
        messages.push("checkTwo - 2");
        if (testVariable == 123) 
            throw;
    }

    modifier checkThree {
        messages.push("checkThree - 1");
        if (testVariable == 123) 
            throw;
        _
        messages.push("checkThree - 2");
        if (testVariable == 123) 
            throw;
        _
        messages.push("checkThree - 3");
        if (testVariable == 123) 
            throw;
    }

    function test() checkOne checkTwo checkThree returns (uint256) {
        messages.push("test - 1");
        testVariable = 345;
        messages.push("test - 2");
        return testVariable;
    }
}
