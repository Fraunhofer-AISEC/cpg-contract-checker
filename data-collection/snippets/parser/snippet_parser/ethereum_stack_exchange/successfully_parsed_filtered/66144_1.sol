struct KeyedMapAddressToBool {
  mapping(address => bool) data;
  mapping(address => uint) indices;
  address[] addresses;
  mapping(address => bool) exists;
}

function set(KeyedMapAddressToBool storage map, address key, bool value) public {
  map.data[key] = value;
  if (map.exists[key] == false) {
    map.indices[key] = map.addresses.length;
    map.addresses.push(key);
    map.exists[key] = true;
  }
}
