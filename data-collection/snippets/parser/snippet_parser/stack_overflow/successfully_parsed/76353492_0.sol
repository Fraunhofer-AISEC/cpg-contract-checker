struct Data {
    uint a;
    uint b;
}

contract A {
    Data public data;

    function callToB() external {
        B.changeData(data);
    }
}


library B {
    function changeData(Data storage _data) external {
        _data.a = 10;
        _data.b = 20;
        emit Events.DataChanged();
    }
}

library Events {
    event DataChanged();
}
