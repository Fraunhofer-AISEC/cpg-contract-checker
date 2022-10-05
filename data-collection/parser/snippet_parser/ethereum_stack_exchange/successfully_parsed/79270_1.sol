pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract DataEntityContract {


    DataEntity DE;

    constructor(string memory _name,string[] memory _relatedEntities, string memory _annotations) public
    {
        DE = DataEntity(_name, _relatedEntities, _annotations);
    }

    struct DataEntity {
        string dataEntityName;
        string[] sources;
        string annotations;
    }

    function getSources() public view returns(string[] memory){
        return (DE.sources);
    }

    function getName() public view returns(string memory){
        return (DE.dataEntityName);
    }

    function getAnnotations() public view returns(string memory) {
        return (DE.annotations);
    }

}
