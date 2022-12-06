contract UserRecord {
  address public owner;
  bytes32[] public Servicelist;

  constructor () public {
    owner = msg.sender;
    newService("1","Serviceone",msg.sender);
  }

  struct Service {
    address serviceowner;
    string servicename;
    bytes serviceid;
    bool isService;
  }

  mapping(bytes32 => Service) public servicestructs;

  function isService(bytes32 uid) public view returns(bool isIndeed) {
    return servicestructs[uid].isService;
  }

  function getServiceCount() public view returns(uint count) {
    return Servicelist.length;
  }

  function newService(bytes32 uid, string memory _servicename, address _serviceowner) public returns(bool success) {
    require(!isService(uid));
    servicestructs[uid].servicename = _servicename;
    servicestructs[uid].serviceowner = _serviceowner;
    servicestructs[uid].isService = true;
    Servicelist.push(uid);
    emit LognewService(owner, uid, _servicename, _serviceowner);
    return true;
  }

  function getService(string memory servicequery) public view returns(bool) {
    for(uint i=0;i<Servicelist.length;i++) {
      Service storage service=Servicelist[i];
      string memory service_name=Servicelist[i].servicename;
      if(keccak256(abi.encodePacked(service_name))==keccak256(abi.encodePacked(service_name))) {
        return service_name;
      }
    }
  } 

  event LognewService(address sender, bytes32 hash, string servicename, address serviceowner);
}
