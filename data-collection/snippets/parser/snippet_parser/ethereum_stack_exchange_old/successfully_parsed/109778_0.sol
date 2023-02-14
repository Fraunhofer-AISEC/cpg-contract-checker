contract Contract {
    enum E {
        A,
        B
    }

    E internal _state;

    constructor () {
        _state = E.A;
    }

    function getState() external view returns (E) {
        return _state;
    }
}
