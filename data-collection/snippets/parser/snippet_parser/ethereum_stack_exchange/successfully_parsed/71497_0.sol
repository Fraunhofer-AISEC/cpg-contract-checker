  
 function getEndpointBroker(address oracleAddress, bytes32 endpoint) public view returns (address) 
  {


return address(db.getBytes(keccak256(abi.encodePacked('oracles', oracleAddress, endpoint, 'broker'))));
}
