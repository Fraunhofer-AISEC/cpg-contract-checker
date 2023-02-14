
    function getConfirmations(uint _transactionId) public view returns (address[] _confirmations)
    {
        for (uint i=0; i < ownersArr.length; i++){
            if (confirmations[_transactionId][ownersArr[i]]){
                _confirmations.push(ownersArr[i]);
            }

        }

    }
