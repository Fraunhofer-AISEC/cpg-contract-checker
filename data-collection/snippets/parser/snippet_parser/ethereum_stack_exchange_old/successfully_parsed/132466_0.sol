function hex2Base10Assembly (bytes16 input) public pure returns (uint output) {
    
    uint power10 = 1;

    assembly {
        input := shr(128, input)
        for { let i := 0 } lt(i, 31) { i := add(i, 1) } {
            output := add(output, mul(mod(input, 16), power10)) 
            input := div(input, 16)
            power10 := mul(power10, 10)
        }             
        output := add(output, mul(mod(input, 16), power10))   
    }
    return output;
}
