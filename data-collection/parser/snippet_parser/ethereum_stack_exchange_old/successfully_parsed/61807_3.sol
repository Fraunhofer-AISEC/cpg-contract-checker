contract Demo {
    event print(address _foo);

    modifier c (address _foo) {
        emit print(_foo);
        _;
    }
    function b (address _foo) c (msg.sender) {
        emit print(_foo);
    }
}
