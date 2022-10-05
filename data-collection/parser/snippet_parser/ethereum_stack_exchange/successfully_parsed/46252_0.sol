function arrMke() public{ 
    bytes32[] arrMke;
    arrMke.push(0X10);
    arrMke.push(0X20);
    arrMke.push(0x10);
    arrMke.push(0X40);
    uint[] arrResult = search(arrMke,0X10);
}

function search(bytes32[] _documentHashes, bytes32 _searchHash) public returns (uint[] result){
    assembly {
        let len := mload(_documentHashes) 
        let counter := 0 
        result := mload(0x40) 
        let i := 0 
        loop: 
        let docHash := mload(add(_documentHashes, add(0x20, mul(i, 0x20)))) 
        if eq(docHash, _searchHash) { 
            counter := add(counter,1) 
            mstore(add(result, 0x20), counter) 
            mstore(add(result, add(0x20, mul(counter, 0x20))), i) 
        }
        i := add(i,1) 
        jumpi(loop, lt(i,len)) 
        mstore(0x40, add(result, add(0x20, mul(counter, 0x20)))) 
    }
}
