for (i = 0; i < words; i++) {
    
    assembly {
        let commonIndex := mul(0x20, add(1, i))
        let maskValue := mload(add(mask, commonIndex))
        mstore(add(array, commonIndex), or(and(not(maskValue), mload(add(array, commonIndex))), and(maskValue, mload(add(desired, commonIndex)))))
    }
}
