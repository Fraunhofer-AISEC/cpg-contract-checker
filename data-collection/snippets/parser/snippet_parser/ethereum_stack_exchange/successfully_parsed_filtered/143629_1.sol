    function testLoop() public{
        for (uint i = 0; i < 100; i++) {
            uint256 gasBefore = gasleft();
            addData(cnt);
            uint256 gasUsedForOperation = gasBefore - gasleft();
        }
    }

