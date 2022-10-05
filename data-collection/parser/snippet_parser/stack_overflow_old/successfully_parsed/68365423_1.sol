function updateEmployee(
    uint256 index,
    int empid,
    string memory name,
    string memory department,
    string memory designation
) public {
    emps[index] = Employee(empid, name, department, designation);
}
