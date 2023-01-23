pragma solidity 0.4.24;

contract database{
struct Data{
    uint index;
    uint value;
}

Data[] public Datas;

  function AddData(uint _index, uint _data) public {
      Datas.push(Data(_index, _data));
  }
}
