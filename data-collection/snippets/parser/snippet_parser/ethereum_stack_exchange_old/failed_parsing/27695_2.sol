  if (gas === null || gas >= 3000000) {
    report.push({
      warning: yo`<span>Gas requirement of function ${contractName}.${functionName} ${gasString}.<br />
      If the gas requirement of a function is higher than the block gas limit, it cannot be executed.
      Please avoid loops in your functions or actions that modify large areas of storage
      (this includes clearing or copying arrays in storage)</span>`
    })
  }
