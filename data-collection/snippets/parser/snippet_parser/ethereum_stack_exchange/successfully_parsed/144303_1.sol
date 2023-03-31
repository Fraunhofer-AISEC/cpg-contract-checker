function testSubmitTransaction() public {

multiSigWalletObj.submitTransaction(1000,0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC);
    (,uint value,,) = multiSigWalletObj.transactionArr._value;
    assertEq(value, 1000);
    emit log_named_uint("The Value in submit Transaction is: ", value);
}
