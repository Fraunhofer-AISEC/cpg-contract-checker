function nice(uint8 x) public  returns(uint8 z){
    uint8 z = 0;
    z = z + 240;
    unchecked {
        z = z + x;
        require(z >= x, "Your custom message here");
    }
}
