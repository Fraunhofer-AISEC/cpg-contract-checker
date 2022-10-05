contract PermissionsTest is Permissions {    
    event LogSuccess();

    constructor(address _permissionsManager)
    Permissions(_permissionsManager)
    public
    {    }

    function testAnyone()
    public  
    {
        emit LogSuccess();
    }

    function testOnlyAdmin()
    public
    onlyAdmin
    {
        emit LogSuccess();
    }
}
