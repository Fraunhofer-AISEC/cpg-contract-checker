function () payable {
    uint amountPerEmployee = msg.value / employees.length;

    
    employees[0].transfer(amountPerEmployee);
}
