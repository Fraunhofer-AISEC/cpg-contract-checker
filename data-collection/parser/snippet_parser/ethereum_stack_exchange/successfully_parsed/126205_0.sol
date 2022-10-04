
pragma solidity ^0.8.0;


contract L1_contract {
    uint256 public a = 0 ;
    function read_a() public view  returns(uint256){
        return a;
    }
    function increament_a() public {
        a +=1 ;
    }
}

contract L2_contract {
    address private l1_contract_address = 0x95aD61b0a150d79219dCF64E1E6Cc01f0B64C4cE;
    uint256 private l1_chain_id = 1 ;
    function read_a_from_l1() public view returns(uint256){

        
        return a_on_l2;
    }
}
