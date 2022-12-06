import { Interface } from "@ethersproject/abi";

const iErrors = new Interface([
    "error Custom1()",
    "error Custom2()",

    "error Custom3(int errorCode, address account)",
    "error Custom4(int errorCode, uint number)",

    "error AccountLocked(address owner, uint256 balance)",

    
]);

const standardErrorString = "0x08c379a0...."; 
const accountLockedErrorData = "0xf7c3865a0000000000000000000000008ba1f109551bd432803012645ac136ddd64dba720000000000000000000000000000000000000000000000000de0b6b3a7640000"

const customErrorDescription = iErrors.parseError(customErrorData); 
