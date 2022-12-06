function updateStruct (string _paramName, string _newValue) {
  tests[msg.sender].(_paramName) = _newValue; 
}
