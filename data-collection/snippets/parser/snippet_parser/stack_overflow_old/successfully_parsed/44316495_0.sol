    pragma solidity 0.5.12;

    contract EventEmitter {

    
    event ConstructorDone(address owner, string message);
    event Counter(uint64 count);

    
    uint64 private _count = 0;
    string constant _message = '0x0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789';

    
    constructor() public {
        emit ConstructorDone(msg.sender, _message);
    }

    
    function getCount() public view returns (uint count) {
        return _count;
    }

    
    function increment() public {
        _count++;
        emit Counter(_count);
    }
}
