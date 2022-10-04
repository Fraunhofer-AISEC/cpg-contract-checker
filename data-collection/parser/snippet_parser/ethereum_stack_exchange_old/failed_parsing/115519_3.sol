  event Log(bytes4 data);

  function log() public {
    emit Log(type(IERC721).interfaceId);
  }
