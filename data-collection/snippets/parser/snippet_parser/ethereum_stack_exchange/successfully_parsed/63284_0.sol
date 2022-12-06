

function MultisigWallet(address[] _owners, uint256 _required, uint256 _daylimit)
    Shareable(_owners, _required)
    DayLimit(_daylimit) { }
