    uint32 positionInArray = 0;
    while(_claimId != array[positionInArray]) {
        positionInArray++;
    }

    for(uint32 i = positionInArray; i < array.length - 1; i++) {
        array[i] = array[i+1];
    }
