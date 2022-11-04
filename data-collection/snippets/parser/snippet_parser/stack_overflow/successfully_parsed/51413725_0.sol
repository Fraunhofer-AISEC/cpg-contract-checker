function _evaluate(uint8[5] _uploads) internal returns (bytes32 resultId){

    resultId= keccak256(abi.encodePacked(now,  msg.sender));

    addressToid[msg.sender] = resultId;
    idToResult[resultId] = Result(msg.sender, r);
  }

function upload(uint8[5] _inputs) public returns ( bytes32 resultId) {

    return _evaluate(_inputs);
  }
