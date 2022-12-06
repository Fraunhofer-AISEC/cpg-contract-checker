function toBytes(string[] strArray)
private
pure
returns(bytes serialized) {
    uint startindex = 0;
    uint endindex = strArray.length - 1;

    require(endindex >= startindex);

    if (endindex > (strArray.length - 1)) {
        endindex = strArray.length - 1;
    }

    
    
    uint offset = 64 * ((endindex - startindex) + 1);

    bytes memory buffer = new bytes(offset);
    string memory out1 = new string(32);


    for (uint i = startindex; i <= endindex; i++) {
        out1 = strArray[i];

        stringToBytes(offset, bytes(out1), buffer);
        offset -= sizeOfString(out1);
    }

    return (buffer);
}

function stringToBytes(uint _offst, bytes memory _input, bytes memory _output)
private
pure {
    uint256 stack_size = _input.length / 32;
    if (_input.length % 32 > 0) stack_size++;

    assembly {
        stack_size: = add(stack_size, 1) 
        for {
            let index: = 0
        }
        lt(index, stack_size) {
            index: = add(index, 1)
        } {
            mstore(add(_output, _offst), mload(add(_input, mul(index, 32))))
            _offst: = sub(_offst, 32)
        }
    }
}


function sizeOfString(string memory _in)
private
pure
returns(uint _size) {
    _size = bytes(_in).length / 32;
    if (bytes(_in).length % 32 != 0)
        _size++;

    _size++; 
    _size *= 32;
}
