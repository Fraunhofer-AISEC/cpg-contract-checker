function stringToUint(string _amount) internal constant returns (uint result) {
    bytes memory b = bytes(_amount);
    uint i;
    uint counterBeforeDot;
    uint counterAfterDot;
    result = 0;
    uint totNum = b.length;
    totNum--;
    bool hasDot = false;

    for (i = 0; i < b.length; i++) {
        uint c = uint(b[i]);

        if (c >= 48 && c <= 57) {
            result = result * 10 + (c - 48);
            counterBeforeDot ++;
            totNum--;
        }

        if(c == 46){
            hasDot = true;
            break;
        }
    }

    if(hasDot) {
        for (uint j = counterBeforeDot + 1; j < 18; j++) {
            uint m = uint(b[j]);

            if (m >= 48 && m <= 57) {
                result = result * 10 + (m - 48);
                counterAfterDot ++;
                totNum--;
            }

            if(totNum == 0){
                break;
            }
        }
    }
     if(counterAfterDot < 18){
         uint addNum = 18 - counterAfterDot;
         uint multuply = 10 ** addNum;
         return result = result * multuply;
     }

     return result;
}
