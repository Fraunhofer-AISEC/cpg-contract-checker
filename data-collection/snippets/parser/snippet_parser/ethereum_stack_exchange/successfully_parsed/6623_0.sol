function numDigits(int number) returns (uint8) {
    uint8 digits = 0;
    
    while (number != 0) {
        number /= 10;
        digits++;
    }
    return digits;
}
