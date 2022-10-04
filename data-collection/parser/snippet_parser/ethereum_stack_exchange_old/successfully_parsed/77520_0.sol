contract BackendProxy {
  address private backendImplementation;
  address private owner;

  constructor (address _backendImplementation) public {
    backendImplementation = _backendImplementation;
    owner = msg.sender;
  }

  function () external payable {
    if (msg.data.length > 0) {
      address oldBackendImplementation = backendImplementation;
      address oldOwner = owner;

      bool status;
      bytes memory data;
      (status, data) = backendImplementation.delegatecall (msg.data);
      require (oldBackendImplementation == backendImplementation);
      require (oldOwner == owner);

      if (status) {
        assembly {
          return (add (data, 0x40), mload (data))
        }
      } else {
        assembly {
          revert (add (data, 0x40), mload (data))
        }
      }
    }
  }

  function setBackendImplementation (address _backendImplementation) public {
    require (msg.sender == owner);
    backendImplementation = _backendImplementation;
  }
}
