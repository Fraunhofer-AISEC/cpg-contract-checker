

pragma solidity >=0.8.0 <0.9.0;
contract Artithmetic{

    uint256  yearlySalary = 250000 ;
    uint256  months = 12;
    uint256 conversionRate = 113;
    uint256 public  monthlySalary = yearlySalary / months * conversionRate;
    string public message = "Import a 2021 Audi A6";
    bool public youreRich = true;

    function updateYearlySalary(uint256 _yearlySalary) public{
        
        yearlySalary = _yearlySalary;
        
    }
    

    function financialAdvice() public {

        if(monthlySalary<=2000000){
            
            youreRich = false;
            message = "Buy assets that earn you passive income first!";
        }

    }}
