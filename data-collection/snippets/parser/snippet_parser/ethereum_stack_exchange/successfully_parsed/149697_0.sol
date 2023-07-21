contract C {
    uint id;
    constructor(uint _id) {
        id = _id;
    }
}

contract CExt is C { }


contract CExtChild is CExt(1) { }
