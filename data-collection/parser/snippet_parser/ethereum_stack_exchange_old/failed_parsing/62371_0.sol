function stringToUint(string s) constant returns ((bool success,uint result)) {
    bytes memory b = bytes(s);
    uint result = 0;
    success = false;
    for (uint i = 0; i < b.length; i++) { 
        if (b[i] >= 48 && b[i] <= 57) {
            result = result * 10 + (uint(b[i]) - 48); 
            success = true;
        } else {
            result = 0
            success = false;
            break;
    }
    } 
    return (success,result);
}
