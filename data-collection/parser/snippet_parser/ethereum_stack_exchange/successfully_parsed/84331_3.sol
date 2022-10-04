    uint256 public gasUsed;

    function measureGas(uint256 _gas, address _tested) public returns (bool) {
        uint256 gasLeft = gasleft();
        bool result = test(_gas, _tested);
        gasUsed = gasLeft - gasleft();
        return result;
    }
