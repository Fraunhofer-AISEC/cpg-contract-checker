
pragma solidity ^0.8.0;

library Test{

    struct Data {
        mapping (bytes => string) a;
    }

    function inc(Data storage self) internal {
        self.a['0'] = "ban";
        self.a['1'] = "sam";
    }

}

contract Example{

    address recipient = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    Test.Data Datastruct;

    
    function setName() public {
        Test.inc(Datastruct);
    }

    function getNames() external view returns(string memory) {
        
        return Datastruct.a['0'];
    }

}
