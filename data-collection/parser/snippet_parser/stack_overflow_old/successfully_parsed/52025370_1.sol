contract SomeData {

    struct Data {
        string id;
        byte[128][100] items;
    }

    mapping (string => Data) dataItems;


    function addData(string id, byte[128][100] items) public {
        Data memory data = Data(id, items);
        data.id = id;
        data.items = items;
        dataItems[id] = data;
    }

    function getDataItems(string id) public view returns (byte[128][100]){
        return (dataItems[id].items);
    }
}
