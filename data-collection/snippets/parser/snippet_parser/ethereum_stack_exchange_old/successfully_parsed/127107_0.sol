contract khiar {
    function mooz(uint size) external {
        
    }

    function bademjoon(uint size) external {
        
        address(this).call(abi.encodeWithSignature("mooz(uint)", size*2));
    }
}
