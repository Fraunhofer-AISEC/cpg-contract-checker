function setWinner() public {

    bytes32 hash = keccak256(abi.encode(block.timestamp));


    bytes4[2] memory x0 = [bytes4(0), 0];
    assembly {
        mstore(x0, hash)
        mstore(add(x0, 4), hash)
    }
    bytes4[2] memory x1 = [bytes4(0), 0];
    assembly {
        mstore(x1, hash)
        mstore(add(x1, 8), hash)
    }
    bytes4[2] memory x2 = [bytes4(0), 0];
    assembly {
        mstore(x2, hash)
        mstore(add(x2, 12), hash)
    }
    bytes4[2] memory x3 = [bytes4(0), 0];
    assembly {
        mstore(x3, hash)
        mstore(add(x3, 16), hash)
    }
    bytes4[2] memory x4 = [bytes4(0), 0];
    assembly {
        mstore(x4, hash)
        mstore(add(x4, 20), hash)
    }
    bytes4[2] memory x5 = [bytes4(0), 0];
    assembly {
        mstore(x5, hash)
        mstore(add(x5, 24), hash)
    }
    bytes4[2] memory x6 = [bytes4(0), 0];
    assembly {
        mstore(x6, hash)
        mstore(add(x6, 28), hash)
    }
    bytes4[2] memory x7 = [bytes4(0), 0];
    assembly {
        mstore(x7, hash)
        mstore(add(x7, 32), hash)
    }

    uint n0 = uint32 (x0[1]); 
    n0 = n0%numberMax;
    uint n1 = uint32 (x1[1]); 
    n1 = n1%numberMax;
    uint n2 = uint32 (x2[1]); 
    n2 = n2%numberMax;
    uint n3 = uint32 (x3[1]); 
    n3 = n3%numberMax;
    uint n4 = uint32 (x4[1]); 
    n4 = n4%numberMax;
    uint n5 = uint32 (x5[1]); 
    n5 = n5%numberMax;
    uint n6 = uint32 (x6[1]); 
    n6 = n6%numberMax;
    uint n7 = uint32 (x7[1]); 
    n7 = n7%numberMax;

    

    uint[qntNumbers] memory tabNumbers = [n0,n1,n2,n3,n4,n5,n6,n7];

    quickSort(tabNumbers,0,tabNumbers.length -1);
    

    
    
    removeDoubles(tabNumbers);

    winnerGame = tabNumbers;

}
