contract NoMixing {

    bytes public first;
    bytes public second;

    function mix() public returns (bytes, bytes) {  

        for (uint8 cnt = 0; cnt<8; cnt++) {
            first.push(9);
        }

        for (uint8 cnt2 = 0; cnt2<8; cnt2++) {
            second.push(8);
        }

        return (first,second);
    }

}
