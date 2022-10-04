contract target {
    string public value = "lol";
    event SetValue(string);

    function setValue(string v) public {
        value = v;
        emit SetValue(v);
    }
}
