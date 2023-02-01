pragma solidity ^0.4.24;

contract SomeData {    
    struct Data {
        string id;
        string[3] items;
    }

    mapping (string => Data) dataItems;

    function addData(string id, string[3] items) public {
        Data memory data = Data(id, items);
        data.id = id;
        data.items = items;
        dataItems[id] = data;
    }

    function getDataItems(string id) public view returns (string[3]){
        return dataItems[id].items;
    }
}
