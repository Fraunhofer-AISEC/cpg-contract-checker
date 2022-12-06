contract OwnableDelegateProxy {}

contract ProxyRegistry {
    mapping(address => OwnableDelegateProxy) public proxies;
}

contract SomeContract {

    address proxyRegistryAddress;

    constructor(
        address _proxyRegistryAddress
    ) {
        proxyRegistryAddress = _proxyRegistryAddress;
    }

    function isApprovedForAll(address owner, address operator)
        public
        view
        returns (bool)
    {
        ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
        if (address(proxyRegistry.proxies(owner)) == operator) {
            return true;
        }
        return false;
    }
}
