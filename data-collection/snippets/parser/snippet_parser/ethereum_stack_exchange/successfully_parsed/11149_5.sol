function remove(string _name, string _surname)  {
    bytes32 _hc = sha3(_name, _surname);
    userRegister[_hc].name = _name;
    userRegister[_hc].surname = _surname;
    userRegister[_hc].active = 0;
}
