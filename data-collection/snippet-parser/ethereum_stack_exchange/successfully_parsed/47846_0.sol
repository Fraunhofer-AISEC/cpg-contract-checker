contract GasDebug {
     event LogGas(uint256 gas);

     modifier debugGasUsed() {
         uint256 startGas = gasleft();
         _;
         uint256 endGas = gasleft();
        LogGas(startGas - endGas);
     }
}
