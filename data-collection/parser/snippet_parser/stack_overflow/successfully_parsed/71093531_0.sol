    function setFunc(bytes calldata _value) public {
        getBytes = _value; 
    }

function getFunc() public view returns(bytes calldata) {
        return getBytes;
    }
