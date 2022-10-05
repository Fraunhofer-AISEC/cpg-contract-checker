function register(string _name) public {
    bool _success = false;
    if (nameToAddress[_name] == address(0)) {
        nameToAddress[_name] = msg.sender;
        _success = true;
    }

    emit isNotify(_success);
}
