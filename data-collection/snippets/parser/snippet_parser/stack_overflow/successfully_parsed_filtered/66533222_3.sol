uint32 private currentValue = 100;

function returnAndIncrement () public returns (uint32) {
    currentValue++;
    return currentValue;
}
