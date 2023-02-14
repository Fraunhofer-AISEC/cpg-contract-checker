pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

import './DEC.sol';

contract DECatalogue
{
    address owner;
    string public name;
    mapping (string => address) dataEntities;
    string[] public dataEntityNames;
    uint public lineageInfoCount = 0;
    uint count = 0;
    uint public notificationCount = 0;
    mapping(uint => Lineage) public lineageInfo;

    struct Lineage
    {
        string name;
        string[] sources;
        string annotations;
    }

    constructor() public
    {
        name = "DataEntityCatalogue Master Contract";
        owner = msg.sender;
    }

    function createNewDataEntity(string memory _name, string[] memory _dataEntities, string memory _date, string memory _fileName, string memory _annotations) public{
        DataEntityContract instance = new DataEntityContract(_name,_dataEntities, _date, _fileName);
        DataEntitiesCount++;
        dataEntityNames.push(_name);
        dataEntities[_name]=address(instance);
    }

    function getLineage(string memory _name) public payable{
        DataEntityContract de = DataEntityContract(dataEntities[_name]);
        string[] memory sources = de.getSources();
        lineageInfo[count] = Lineage(de.getName(), sources, de.getAnnotations());
        count++;
        if(sources.length==0){
            return;
        }
        else{
            for(uint i=0;i<sources.length;i++){
                getLineage(sources[i]);
            }
        }
        lineageInfoCount = count;
        count=0;
    }
}
