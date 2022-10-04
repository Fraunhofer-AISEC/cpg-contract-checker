    function addAdmin(address adminAddress) onlyCreator public returns (uint256) {
        require(adminAddress!= address(0));

        if (!adminExist(adminAddress)) {
            var newAdmin = Admin(adminIndex.length, adminAddress);

            mapping_admin[adminAddress] = newAdmin ;
            adminIndex.push(adminAddress);

            return newAdmin.adminId;
        }
    }
