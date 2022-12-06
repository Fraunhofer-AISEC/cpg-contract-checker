pragma solidity ^0.4.19;
pragma experimental "ABIEncoderV2";


library SetLib {
  using SetLib for Set;

  struct Set {
    mapping(address => IndexData) _dataMap;
    uint16 _size;
    IndexData[] _dataIndex;
  }

  struct IndexData {
    uint16 _index;
    bool _isDeleted;
    Element _element;
  }

  struct Element {
    address _value;
    uint8 _status;
  }

  function add(Set storage self, Element element) internal returns (bool) {
    if (element._value == 0x0 || self.contains(element)) {
      return false;
    }

    IndexData memory data;

    data._index = uint16(self._dataIndex.length);
    data._element = element;

    self._dataMap[element._value] = data;
    self._dataIndex.push(data);
    self._size++;

    return true;
  }

  function update(Set storage self, Element element) internal {
    if (element._value != 0x0) {
      IndexData storage data = self._dataMap[element._value];

      if (data._element._value == element._value && !data._isDeleted && element._status != data._element._status)
        data._element._status = element._status;
    }
  }

  function getByIndex(Set storage self, uint16 index) internal constant returns (Element) {
    IndexData storage data = self._dataIndex[index];

    if (!data._isDeleted) {
      return data._element;
    }
  }

  function get(Set storage self, address addr) internal constant returns (Element) {
    IndexData storage data = self._dataMap[addr];

    if (!data._isDeleted) {
      return data._element;
    }
  }

  function contains(Set storage self, Element element) internal constant returns (bool) {
    return self.contains(element._value);
  }

  function contains(Set storage self, address addr) internal constant returns (bool) {
    if (addr != 0x0) {
      IndexData storage data = self._dataMap[addr];

      return data._index > 0 && !data._isDeleted;
    }

    return false;
  }

  function remove(Set storage self, uint16 index) internal returns (Element) {
    IndexData storage data = self._dataIndex[index];

    if (data._element._value != 0x0 && !data._isDeleted) {
      data._isDeleted = true;
      self._size--;
      return data._element;
    }
  }

  function remove(Set storage self, address addr) internal returns (Element) {
    if (addr != 0x0) {
      IndexData storage data = self._dataMap[addr];

      if (data._element._value != 0x0 && !data._isDeleted) {
        data._isDeleted = true;
        self._size--;
        return data._element;
      }
    }
  }

  function size(Set storage self) internal constant returns (uint16) {
    return self._size;
  }
}

library IteratorLib {
  using SetLib for SetLib.Set;

  struct Iterator {
    bool _started; 
    uint16 _curIndex;
    uint16 _size;
  }

  function iterator(SetLib.Set storage set) internal constant returns (IteratorLib.Iterator) {
    return IteratorLib.Iterator(false, 0, set.size());
  }

  function hasNext(Iterator self, SetLib.Set storage set) internal constant returns (bool) {
    uint16 testIndex = self._curIndex;

    while (testIndex < self._size) {
      if (set._dataIndex[testIndex]._element._value != 0x0 && !set._dataIndex[testIndex]._isDeleted)
        return true;

      testIndex++;
    }

    return false;
  }

  function next(Iterator self, SetLib.Set storage set) internal constant returns (SetLib.Element) {
    SetLib.Element memory element;

    do {
      if (self._started) {
        self._curIndex++;
      }
      else {
        self._started = true;
      }

      element = set.getByIndex(self._curIndex);
    }
    while (element._value != 0x0 && self._curIndex < self._size);

    return element;
  }
}
