address bossAddress;
address employeeAddress;
uint256 bossSalary;
uint256 employeeSalary;
function payout (){
    if (msg.sender==bossAddress){
            employeeAddress.send(employeeSalary);
            bossAddress.send(bossSalary);
            selfdestruct(bossAddress);
    }
}
