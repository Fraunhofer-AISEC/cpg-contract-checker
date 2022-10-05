


contract Counters {

  uint[] counters;

  function _getCounter(uint _index) view private returns (uint, bool success) {
    require(_index >= 0 && _index < counters.length);
    return (counters[_index], true); 
  }

  function checkCounter(uint _index) view public returns ( ... ) {
    uint counter;
    bool success;
    (counter, success) = _getCounter(_index);
    if (success == false) { ... } else { ... };
  }

}
