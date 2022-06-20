contract EventEmitter {
  event MyEventWithData(uint, string);

  function emitMyEventWithData(uint x, string calldata s) public {
    emit MyEventWithData(x, s);
  }
}
