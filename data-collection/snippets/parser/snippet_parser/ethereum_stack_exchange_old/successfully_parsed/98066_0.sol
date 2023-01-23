constructor (address _proxyOwner, address _implementation, bytes memory initializationData, bool forceCall) {
        _setProxyOwner(_proxyOwner);
        _setImplementation(_implementation);
        if (initializationData.length > 0 || forceCall) {
            Address.functionDelegateCall(implementation(), initializationData);
        }
    }
