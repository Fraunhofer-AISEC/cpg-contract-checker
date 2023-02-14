pragma solidity 0.4.13;

contract Storage {

    mapping(uint => bytes32) public byteMap;

    function setStorage(uint key, bytes32 value) public returns(bool success) {
        byteMap[key] = value;
        return true;
    }

    function getStorage(uint key) public constant returns(bytes32 value) {
        return byteMap[key];
    }
}

contract Client {

    Storage datastore;

    function Client(address storageAddress) public {
        datastore = Storage(storageAddress);
    }

    function setValue(uint key, bytes32 value) public returns(bool success) {
        datastore.setStorage(key, value);
        return true;
    }

    function getValue(uint key) public constant returns(bytes32 value) {
        return datastore.getStorage(key);
    }
}

contract ClientFactory {

    event LogNewClientCreated(address sender, address newClient);

    function createClient(address storageContract) public returns(address newClient) {
        Client c = new Client(storageContract);
        LogNewClientCreated(msg.sender, c);
        return c;
    }
}
