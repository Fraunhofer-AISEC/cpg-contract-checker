struct KeyedMapAddressToBool {
  mapping(address => bool) data;
  mapping(address => uint) indices;
  address[] addresses;
}

function set(KeyedMapAddressToBool storage map, address key, bool value) public {
  map.data[key] = value;
  
  address a = map.addresses[0];
}
