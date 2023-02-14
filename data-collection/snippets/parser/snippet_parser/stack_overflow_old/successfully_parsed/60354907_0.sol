
contract Seller {
    struct Detail {
        bool applied;
        string description;
        string email;
    }

    mapping(address => Detail) public details;

    function register(string memory _email, string memory _description) public {
        require(!details[msg.sender].applied);
        details[msg.sender].description = _description;
        details[msg.sender].email = _email;
        details[msg.sender].applied = true;
    }

    function isRegistered() public view returns (bool) {
        return details[msg.sender].applied;
    }

}
