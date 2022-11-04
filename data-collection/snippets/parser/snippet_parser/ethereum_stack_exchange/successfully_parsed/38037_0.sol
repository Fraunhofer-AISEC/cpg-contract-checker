contract User {
    using strings for *;
     address public DB;
    function User(address _DB) {
        if(_DB == 0x0) throw;
        DB = _DB;
    }
    function setUser(string name, string email) public {
        UserLibrary.setUser(DB, msg.sender, name, email);
    }
}