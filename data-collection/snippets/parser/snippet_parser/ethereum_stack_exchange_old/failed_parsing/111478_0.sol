 event ReportCost(
      uint gasCost
 )
 function doSomethingExpensive() public {
      uint startGas = gasleft();
      
      uint endGas = gasleft()
      emit ReportGas(startGas-endGas)
 }
