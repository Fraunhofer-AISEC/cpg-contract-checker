pragma solidity ^0.4.21;

contract test {

event LogTest(
    bytes32[5] a
); 

bytes32[5]  arr;    
mapping (uint=>bytes32) attr;


function attributes() internal returns(bytes32[5]){
    bytes32[5] x;
    attr[0] = "0x0"; attr[1] = "0x1"; attr[2] = "0x2"; attr[3] = "0x3"; attr[4] = "0x4";

    for(uint i=0;i<5;i++){
        x[i] = attr[i];
    }
    return(x);
}


function copy() public {
    arr = attributes();
    LogTest(arr);
}    

}
