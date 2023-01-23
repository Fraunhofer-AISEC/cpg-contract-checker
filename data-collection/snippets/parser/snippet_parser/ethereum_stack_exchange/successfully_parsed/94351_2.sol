error Overflow(uint8 z, uint8 x);

function nice(uint8 x) public  returns(uint8 z){
    uint8 z = 0;
    z = z + 240;
    unchecked {
        z = z + x;
        if (z < x) {
            revert Overflow(x, z);
        }
    }
}
