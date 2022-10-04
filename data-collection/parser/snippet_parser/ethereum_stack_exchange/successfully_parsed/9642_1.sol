pragma solidity ^0.4.0;

contract DataStore{
    struct DataModel {
        uint id;
        bytes32 string1;
        bytes32 string2;
        bytes32 string3;
        uint actorId;
        bytes32 string4;
        bytes32 string5;
        bytes32 string6;
        bytes32 string7;
    }

    mapping(bytes32 => DataModel) dataMapping;
    address owner;

    function DataStore() {
        owner = msg.sender;
    }

    function storeData(bytes32 hash, uint id, bytes32 string1, bytes32 string2, 
      bytes32 string3, uint actorId, bytes32 string4, bytes32 string5, 
      bytes32 string6, bytes32 string7) returns (bool response) {
        if (msg.sender != owner) {
            return false;
        } else {
            DataModel memory datamodel;
            datamodel.id = id;
            datamodel.string1 = string1;
            datamodel.string2 = string2;
            datamodel.string3 = string3;
            datamodel.actorId = actorId;
            datamodel.string4 = string4;
            datamodel.string5 = string5;
            datamodel.string6 = string6;
            datamodel.string7 = string7;
            dataMapping[hash] = datamodel;
            return true;
        }
    }

    function queryData(bytes32 hash) constant returns (uint, bytes32, bytes32, 
      bytes32, uint, bytes32, bytes32, bytes32, bytes32) {
        if (msg.sender != owner) {
            throw;
        }
        DataModel memory model = dataMapping[hash];
        return (model.id, model.string1, model.string2, model.string3, 
          model.actorId, model.string4, model.string5, model.string6, 
          model.string7);
    }
}
