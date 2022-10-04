import "./tokentrial.sol";
pragma solidity ^0.8.0;
contract solution{
    address public solAddress;
    uint256 public employerPay;
    MyToken public generatedToken;
    constructor(address  _solAddress){
        solAddress = _solAddress;
        employerPay = 0;
    }
    function getAddress()public returns(address){
        return solAddress;
    }
   function getPay(uint256 salary)public{
        employerPay = salary;
        
    }
    function makeToken() public{
        generatedToken = new MyToken(employerPay);
    }
    function getToken()public returns(MyToken){
        return generatedToken;
    }
    
}

contract main{
    
    employeeBank public empBank;
    
    employee public emp;
    
    solution public soln;
    
    MyToken public createdToken;
    
    
    uint256 public employerPaid;
    
    address public bossAddress;
    constructor(string memory _vaultKey){
        security = new vault(_vaultKey);
    }
    
    function setPartiesAddr(address bossAddr,address empAddr,address bankAddr, address solnAddr)public{

        emp = new employee(empAddr);
        empBank = new employeeBank(bankAddr);
        soln = new solution(solnAddr);
        mainManager = new manager();
        bossAddress = bossAddr;
    }
    function payEmployee(uint256 salary)public{
        
        
        
        require(security.getValidity() == true,"vault key must be correct");
        employerPaid = salary;
        soln.getPay(employerPaid);
        soln.makeToken();
        createdToken = soln.getToken();
      
    
    }

    function employeeReceiveToken()public{

        createdToken.transferFrom(msg.sender,emp.getAddress(),1);
    }
    function viewSupply()public returns(uint){
        return createdToken.totalSupply();
    }

}

