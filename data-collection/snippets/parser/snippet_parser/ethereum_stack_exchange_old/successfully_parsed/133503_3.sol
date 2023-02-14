    function getCompanyEmployees(uint256 companyId) public view returns(Employee[] memory) {

        return companyEmployees[companyId];

    }
