    const test = useContractReader(writeContracts, "YourContract", "getTest", "1", "0"); 

  function getTestName() {
    if (test == null) {
      return "test is undefined.";
    } else if (test[0] == null) { 
      return "noName";
    } else {
      return test[0].toString();
    }
  }
