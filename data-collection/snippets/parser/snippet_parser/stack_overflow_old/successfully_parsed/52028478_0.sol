function AddData(uint _index, string _projectName, string _devAddress, string _developer) public {
    Datas[_index] = Data(_index, 0, _projectName, _devAddress, _developer);
}
