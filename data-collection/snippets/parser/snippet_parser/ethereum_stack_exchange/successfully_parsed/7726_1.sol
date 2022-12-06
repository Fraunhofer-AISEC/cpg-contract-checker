contract A{
    function getZ() returns(uint8[2]){
        uint8[2] memory z = [255, 255];

        return z;
    }
}
