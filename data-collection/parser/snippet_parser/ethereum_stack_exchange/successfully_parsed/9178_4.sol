library Library {
    function func () constant returns (uint8) {
        return 5;
    }
}

contract Contract {
    uint8 public value;
    function call_library_function () {
        value = Library.func();
    }
}
