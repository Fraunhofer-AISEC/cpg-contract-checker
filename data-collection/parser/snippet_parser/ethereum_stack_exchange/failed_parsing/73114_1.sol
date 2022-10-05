contract yourContract {
  event RestrictedFromDividendEvent(
    uint RestrictedFromDividend
  );

  mapping(address => uint) public _RestrictedFromDividend; 

  

    _RestrictedFromDividend[address(msg.sender)] = 1;
    emit RestrictedFromDividendEvent(
      _RestrictedFromDividend[address(msg.sender)]
    );

  
}
