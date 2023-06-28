if (success) {
    bool boolVal;
    if (returnData.length >= 1) {
        assembly {
            boolVal := mload(add(returnData, 32))
        }
    } else {
        boolVal = false;
    }
}
