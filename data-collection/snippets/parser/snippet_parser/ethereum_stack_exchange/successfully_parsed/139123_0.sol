bytes memory data = abi.encodeWithSelector(someSelector,someAddressVar,someUintVar);
somecontract.delegatecall(data);

