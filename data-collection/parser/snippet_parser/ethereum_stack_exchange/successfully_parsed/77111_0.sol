library Roles {
    enum Flag {
        Role1,
        Role2,
        Role3
    }

    function isAuthorizedToRole1(uint256 _flags) internal pure returns (bool) {return isAuthorized(_flags, Flag.Role1);}
    function isAuthorizedToRole2(uint256 _flags) internal pure returns (bool) {return isAuthorized(_flags, Flag.Role2);}
    function isAuthorizedToRole3(uint256 _flags) internal pure returns (bool) {return isAuthorized(_flags, Flag.Role3);}
    function isAuthorized(uint256 _flags, Flag _flag) private pure returns (bool) {return ((_flags >> uint256(_flag)) & 1) == 1;}
}
