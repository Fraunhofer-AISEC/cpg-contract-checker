function mode(uint[] memory array) public pure returns(uint)
    {
        uint  modeValue; 
        uint[] memory count; 
        uint  number; 
        uint maxIndex = 0;
        

    for (uint i = 0; i < array.length; i += 1) {
        number = array[i];
        count[number] = (count[number]) + 1;
        if (count[number] > maxIndex) {
            maxIndex = count[number];
        }
    }

    for (uint i =0;i<count.length; i++)
        if (count[i] == maxIndex) {
                modeValue=count[i];
                break;
            }

    return modeValue;
    }```
