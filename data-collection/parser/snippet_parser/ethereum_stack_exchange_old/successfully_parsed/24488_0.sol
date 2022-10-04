



contract HelpLogs {

  event LogFirstHalf(bytes _data);
  event LogSecondHalf(bytes _data);

  function logit(bytes data) external {
    
    
    LogFirstHalf(data);
  }
}
