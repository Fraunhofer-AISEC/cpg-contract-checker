mapping (string => address) private stringsToAddresses;
mapping (address => Value) private addressesToValues;

function addValue (string memory s, address a, Value memory v) public {
    stringsToAddresses [s] = a;
    addressesToValues [a] = v;
}

function getValueByString (string memory s) public view returns (Value) {
    return addressesToValues [stringsToAddresses [s]];
}

function getValueByAddress (address a) public view returns (Value) {
    return addressesToValues [a];
}
