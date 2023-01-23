StandaloneBlockchain bc = new StandaloneBlockchain();

SolidityContract contract = bc.submitNewContract(
       "contract A { uint a; ... }"
);

contract.callFunction("funcName", "arg1", 2, new byte[] {1,2,3}, "arg4");
bc.createBlock()

System.out.println("Result: " + contract.callConstFunction("getResultFunc"));
