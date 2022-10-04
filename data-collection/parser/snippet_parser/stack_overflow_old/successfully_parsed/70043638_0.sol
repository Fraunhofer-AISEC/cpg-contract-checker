

pragma solidity >=0.5.0 <0.6.0;

import "https://github.com/provable-things/ethereum-api/blob/master/provableAPI_0.5.sol";

contract Oracle is usingProvable {
    string public activity;

   function __callback(bytes32 _myid, string memory _result) public {
       require(msg.sender == provable_cbAddress());
       
       activity = _result;
       _myid;
   }

   function getActivity() public payable {
       provable_query("URL", "json(https://www.boredapi.com/api/activity/).activity");
   }
}
