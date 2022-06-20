pragma solidity ^0.5.2;
pragma experimental ABIEncoderV2;   

contract PartProductionContract {
    
    Production public production;

    
    function production2() public returns (Production memory) {
        return production;
    }
}



contract Test is PartProduction {

    function testSetParameters() public {
        
        Production memory prod = partProductionContract.production2();
        string memory _val1 = "someString";
        Assert.equal(prod.val1, _val1, "msg.sender: ");
    }
}
