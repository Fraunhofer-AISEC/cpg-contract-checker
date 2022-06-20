    mapping (address => bool) enabled;

    function checkToken(address a) public returns (address) {
        require(enabled[a], "Addresss not enabled");

}