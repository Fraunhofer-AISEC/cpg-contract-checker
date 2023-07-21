contract UpgradableProxy is Proxy {
    event ProxyUpdated(address indexed _new, address indexed _old);
    event ProxyOwnerUpdate(address _new, address _old);

    bytes32 constant IMPLEMENTATION_SLOT =
        keccak256("HelloWorld.proxy.implementation");
    bytes32 constant OWNER_SLOT = keccak256("HelloWorld.proxy.owner");

    constructor(address _proxyTo) {
        setProxyOwner(msg.sender);
        setImplementation(_proxyTo);
    }
}