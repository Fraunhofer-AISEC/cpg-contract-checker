contract first{

    struct dataStruct {
        uint value;
        address addr;
    }

    dataStruct public data1;
    dataStruct public data2;

    constructor() public {
        data1.addr = msg.sender;
        data1.value = 7;
    }

    function passdata(address ic) public {
        first r = first(ic);
        r.recdata(data1);
    }


    function recdata(dataStruct data) public returns (uint, address) {
        data2.addr = data.addr;
        data2.value = data.value;
    }

}
