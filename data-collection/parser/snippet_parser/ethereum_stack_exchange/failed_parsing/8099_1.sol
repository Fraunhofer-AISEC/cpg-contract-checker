assembly {
    let returnSize = 32
    calldatacopy(0xff, 0, calldatasize)
    let _retVal = delegatecall(gas, currentVersion, 0xff, calldatasize, 0, returnSize)
    switch _retval case 0 { revert(0,0) } default { return(0, returnSize) }
}
