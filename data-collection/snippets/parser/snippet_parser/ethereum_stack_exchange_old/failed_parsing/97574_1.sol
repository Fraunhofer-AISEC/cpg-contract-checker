
uint256 _owner; 


Deposit(address, address, uint256);
OwnershipTransferred(address, address);

**function unknownfunction(address varg0, uint256 varg1) public payable { 
    v0 = new bytes[](varg1.length);
    v1 = msg.data.length;
    CALLDATACOPY(v0.data, 36 + varg1, varg1.length);
    require(msg.sender == _owner);
    v2 = v3 = 0;
    while (v2 < v0.length) {
        MEM[v2 + v4.data] = MEM[v2 + v0.data];
        v2 += 32;
    }
    v5 = v6 = v0.length + v4.data;
    if (0x1f & v0.length) {
        MEM[v6 - (0x1f & v0.length)] = ~(256 ** (32 - (0x1f & v0.length)) - 1) & MEM[v6 - (0x1f & v0.length)];
    }
    v7 = varg0.call(v4.data).value(msg.value).gas(msg.gas);
    require(v7);
}**

function transferOwnership(address varg0) public nonPayable { 
    require(msg.sender == _owner);
    require(varg0);
    emit OwnershipTransferred(_owner, varg0);
    _owner = varg0;
}

function fallback() public payable { 
    v0 = _owner.call().value(msg.value).gas(msg.gas);
    require(v0);
    emit Deposit(msg.sender, _owner, msg.value);
}

function transferToOwner(address varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(varg0.code.size);
    v0 = varg0.transfer(_owner, varg1).gas(msg.gas);
    require(v0); 
}

function owner() public nonPayable { 
    return _owner;
}




function __function_selector__(uint32 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (function_selector == 0x8568523a) {
            transferToOwner(address,uint256);
        } else if (0x8da5cb5b == function_selector) {
            owner();
        } else if (0xb76ea962 == function_selector) {
            0xb76ea962();
        } else if (0xf2fde38b == function_selector) {
            transferOwnership(address);
        }
    }
    fallback();
}
