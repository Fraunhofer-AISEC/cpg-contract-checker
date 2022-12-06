
struct Data {
    int256 count;
    mapping(address => int256) indices;
    mapping(int256 => address) items;
}


function append(Data storage self, address addr)
internal
returns (bool) {
    if (addr == ZERO_ADDRESS) {
        return false;
    }

    int256 index = self.indices[addr] - 1;
    if (index >= 0 && index < self.count) {
        return false;
    }

    self.count++;
    self.indices[addr] = self.count;
    self.items[self.count] = addr;
    return true;
}
