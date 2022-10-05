  event MyEvent(string s1, string s2);

  function _emitEvent(event eventName) internal {
    emit eventName('hello', 'world');
  {

  function otherFunc() public {
    _emitEvent(MyEvent);
  }
