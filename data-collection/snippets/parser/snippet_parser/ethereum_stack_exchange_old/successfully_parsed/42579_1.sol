contract Demo {
  uint _var;
  uint public _lastTimeVarWritten;

  event LogLastTimeVarWritten(uint timestamp);

  function setVar(uint var1){
    _var=var1;
    _lastTimeVarWritten = block.timestamp;
    LogLastTimeVarWritten(_lastTimeVarWritten);
  }
}
