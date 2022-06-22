



abstract contract Config {
   function lookup(uint id) public virtual returns (address adr);
}




contract Named is Owned, Destructible {
   constructor(bytes32 name) {
       Config config = Config(0xD5f9D8D94886E70b06E474c3fB14Fd43E2f23970);
       NameReg(config.lookup(1)).register(name);
   }
....
