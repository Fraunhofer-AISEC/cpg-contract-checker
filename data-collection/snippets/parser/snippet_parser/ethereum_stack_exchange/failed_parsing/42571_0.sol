contact Rabbit {
    string public name;

    function setName(string n) returns (bool) {
        name = n;
        return true;
    }
}
