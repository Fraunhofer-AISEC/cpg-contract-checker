    uint256 arrLength = arr.length;
    assembly{
        let offset := sload(arrLength)
        res:= mload(add(arrLength,0x20)) 
    }
