contract TestContract
{
    struct Structure {
        bytes32 structure_name;
    }

    mapping (Structure => address) public test_mapping;
}
