contract structtestmapping {
    struct myStruct {
        uint id;
    }
    mapping(string => myStruct) mapmystruct;
    myStruct s = mapmystruct['mystring'];

}
