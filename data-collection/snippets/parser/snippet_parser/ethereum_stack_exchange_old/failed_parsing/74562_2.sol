pragma solidity ^0.5.1;

import "./Contract(A).sol";

contract Contract(B) is Contract(A) {

  constructor(
        address _mySign
        ) public {
        s = EternalStorage(_mySign);

   }

function getData(
    bytes32 _id,
    string memory _hash,
    address _owner
    ) public returns (bool success) {
    s.setAddress(keccak256(abi.encodePacked("data- crypto",_id)), data[_id].owner);
    s.setString(keccak256(abi.encodePacked("data- crypto",_id)), data[_id]._hash);
}
}
