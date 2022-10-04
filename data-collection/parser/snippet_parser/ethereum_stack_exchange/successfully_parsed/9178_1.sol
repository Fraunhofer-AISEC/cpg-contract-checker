library Library {
    function func () constant returns (uint8) {
        return 5;
    }
}

contract Contract {
    uint8 value;
    function call_library_function () {
        value = Library.func();
    }
}
