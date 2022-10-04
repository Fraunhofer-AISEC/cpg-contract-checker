contract PrivilegesContract is SuperAdminContract {

    struct Privilege {
        uint Id;
        string Name;
    }

    uint private privilegeId;
    mapping(uint => string) private Privileges;

    function Add(string name) public EnsureSuperAdmin returns (uint) {
        Privileges[privilegeId] = name;
        privilegeId = privilegeId +1;
        return privilegeId;
    }
}
