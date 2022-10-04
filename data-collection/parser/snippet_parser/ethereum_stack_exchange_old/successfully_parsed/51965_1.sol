pragma solidity 0.4.24;

contract StoreInterface {
    function getWeight() public view returns(uint);
    function setWeight(uint weight) public returns(bool); 
}



contract Store is StoreInterface {

    uint weight;

    event LogSetWeight(address sender, uint weight);

    function getWeight() public view returns(uint) {
        return weight;
    }

    function setWeight(uint _weight) public returns(bool) {
        weight = _weight;
        emit LogSetWeight(msg.sender, _weight);
        return true;
    } 
}

contract Reader {

    StoreInterface store;

    constructor(address storeAddress) public {
        store = StoreInterface(storeAddress);
    }

    function getWeight() public view returns(uint) {
        return store.getWeight();
    }

    function setWeight(uint weight) public returns(bool) {
        return store.setWeight(weight);
    }
}
