  function addSimpleStruct(bytes32 key, bytes32 _desc) public { 

    require(msg.sender == requesting); 

    simpleStruct storage newStruct; <-----
    newStruct.desc = _desc; 
    newStruct.startTime = now; 
    insert(data, key, newStruct); 
  }
