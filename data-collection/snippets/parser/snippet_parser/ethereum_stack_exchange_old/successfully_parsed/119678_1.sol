
contract TwosComplement {

    function twos_comp_to_sign_mag(int8 value) external pure returns(int8) {
        
        int8 mask = 2**7 - 1; 

        if (value < 0) {
            value = -(value & mask);
        }
        return (-1 & value) | (value & mask);        
    }
}
