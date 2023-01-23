contract MainToken is ERC777 {
    address[] ops=;
  constructor ()  ERC777("MYTOKEN", "MTK",ops) {
      ops.push(msg.sender);
    }
...
}
