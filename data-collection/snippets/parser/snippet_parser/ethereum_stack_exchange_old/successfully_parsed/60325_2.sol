
    function Execution (address _Address, uint _Amount) {
        receiver = _Address;
        receiver.transfer(_Amount);
    }
