pragma experimental ABIEncoderV2;
pragma solidity ^0.6.0;
 
interface params {
     struct  structTest {
        uint256 data;
    }
}

contract contractA is params{
    function testCall(structTest calldata _structParams) public pure returns (uint256){
        return _structParams.data;
    }
}

contract contractB is params{
    contractA aContractInstance;
    
    constructor (address _a) public {
        aContractInstance = contractA(_a);
    }
    
    function test(structTest calldata _structParams) public view returns(uint256){
        
        return aContractInstance.testCall(_structParams);
    }
}
