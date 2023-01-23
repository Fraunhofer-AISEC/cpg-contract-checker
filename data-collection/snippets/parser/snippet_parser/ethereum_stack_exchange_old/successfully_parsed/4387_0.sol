contract NameRegistry {

  function NameRegistry() {
    
  }

  function register(address record, string namespace, string name) returns (bool success) {
    if (names[namespace][name] > 0) {
      return false;
    }

    names[namespace][name] = record;
    return true;
  }

  function lookup(string namespace, string name) returns (address record) {
    return names[namespace][name];
  }

  
  mapping(string => mapping(string => address)) names;
}
