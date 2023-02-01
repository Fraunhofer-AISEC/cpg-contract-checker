function addXtoAccName( address _accNumber, string _xtoName ) public memory {
        accounts[_accNumber].xtoDisplayName = _xtoName;
        accounts[_accNumber].xtoAccNumber = _accNumber;
}
