function adminExist(address newAdmin) public view returns (bool adminExist) {
        if (adminIndex.length == 0)
            return false;

        return (adminIndex[mapping_admin[newAdmin].adminId] == newAddress);
    }
