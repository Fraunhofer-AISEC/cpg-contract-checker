

contract DSChief is DSRoles, DSChiefApprovals {

    function setOwner(address owner_) public {
        owner_;
        revert();
    }

    function setAuthority(DSAuthority authority_) public {
        authority_;
        revert();
    }

    function setRootUser(address who, bool enabled) public {
        who; enabled;
        revert();
    }
}
