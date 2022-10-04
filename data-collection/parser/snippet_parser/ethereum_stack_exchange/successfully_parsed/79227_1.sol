function set(uint _index, string calldata _data_to_store) external {
    require(bytes(storedData[_index]).length == 0);
    storedData[_index] = _data_to_store;
}
