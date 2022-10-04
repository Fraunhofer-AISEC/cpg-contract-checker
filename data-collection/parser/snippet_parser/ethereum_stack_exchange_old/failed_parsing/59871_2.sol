function insertClientCase(bytes32 clientId, bytes32 caseId, string attributes ... {
  require(client[clientId].isClient); 
  require(!cases[caseId].isCase); 
  clients[clientId].cases.push(caseId); 
  cases[caseId].isCase = true; 
  cases[caseId].atttributes = attributes; 
  caseIdList.push(caseId); 
  emit LogNewClientCase(msg.sender, clientId, caseId, attributes, ...); 
  return true;
}
