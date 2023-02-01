contract BalancerV2 {
    IVault private constant vault = "0xBA12222222228d8Ba445958a75a0704d566BF2C8";

    function getPoolTokens() public view returns(uint) {
        return vault.getPoolTokens(0x5c6ee304399dbdb9c8ef030ab642b10820db8f56000200000000000000000014);
    }
    
}
