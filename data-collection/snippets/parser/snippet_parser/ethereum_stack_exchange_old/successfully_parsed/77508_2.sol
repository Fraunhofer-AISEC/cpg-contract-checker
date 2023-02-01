function teste() public view returns (int[] memory v) {
    
    int[] memory x = new int[](matriz.length);
    int[] memory y = new int[](matriz.length);

    uint t = matriz.length;
    for(uint i = 0; i < t; i++) {
        x[i] = matriz[i][0];
        y[i] = matriz[i][1];
    }
    return x;
}
