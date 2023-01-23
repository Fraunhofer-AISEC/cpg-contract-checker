    
    
    
    function getConfirmations(uint transactionId)
        public
        view
        returns (address[] _confirmations)
    {
        address[] memory confirmationsTemp = new address[](ownersArr.length);
        uint count = 0;
        uint i;
        for (i=0; i<ownersArr.length; i++)
            if (confirmations[transactionId][ownersArr[i]]) {
                confirmationsTemp[count] = ownersArr[i];
                count += 1;
            }
        _confirmations = new address[](count);
        for (i=0; i<count; i++)
            _confirmations[i] = confirmationsTemp[i];
    }
