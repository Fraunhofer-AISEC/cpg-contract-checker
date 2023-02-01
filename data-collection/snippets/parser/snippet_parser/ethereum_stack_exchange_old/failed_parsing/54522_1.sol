 contract B {
function verifAtt(uint idRequiredData, uint P, address userAddress) public returns (bool answer){
    answer=false;
    if(P==1) {
                bytes4 sig = bytes4(keccak256("verifyUser(address)"));
                assembly {
                    
                    let ptr := mload(0x40)
                    
                    mstore(ptr,sig)
                    
                    mstore(add(ptr,0x04), userAddress)

                    let result := call(
                      15000, 
                      sload(dc), 
                      0, 
                      ptr, 
                      0x24, 
                      ptr,  
                      0x20) 
                    if eq(result, 0) {
                       revert(0, 0)
                    }
                    answer := mload(ptr) 
                    mstore(0x40,add(ptr,0x24)) 
                }
            }
        }
return answer
}
