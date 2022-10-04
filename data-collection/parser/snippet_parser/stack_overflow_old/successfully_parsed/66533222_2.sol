uint32 private currentValue = 100;

function returnAndIncrement () public returns (uint32 value) {
    
    value = currentValue;         

    
    currentValue = currentValue + 1;

    
    return value;                     
}
