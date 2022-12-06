contract NumberConfigOptionDefinition is ConfigOptionDefinition {
    NumberValidation public validator;

    constructor(string memory _name, AccessControl _readAccess, AccessControl _writeAccess, NumberValidation _validator)
        ConfigOptionDefinition(_name, _readAccess, _writeAccess) public {
        validator = _validator;
    }
}

contract ConfigOptionDefinition {
    ... fields ...

    constructor(string memory _name, AccessControl _readAccess, AccessControl _writeAccess) internal {
        name = _name;
        readAccess = _readAccess;
        writeAccess = _writeAccess;
    }
