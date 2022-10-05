  function () external payable {

    require( msg.value == price );
    addressIndex.push(msg.sender);
    distribute();
  }
