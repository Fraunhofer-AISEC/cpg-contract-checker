function bytesToUint(bytes b) constant returns (uint result) {

    result = 0;
    for (uint i = 0; i < b.length; i++) { 
        if (b[i] >= 48 && b[i] <= 57) {
            result = result * 10 + (uint(b[i]) - 48); 
        }
    }
    return result;
    }
