pragma solidity >=0.5.0 <0.7.0;

contract CompositeManager {
    uint private conType;

     
    function getType() external view 
                       returns(uint)
    {
        return conType;
    }

    constructor(uint _type) public {
        conType = _type;
    }
}
