pragma solidity ^0.4.17;

import "https://github.com/giupt/deBIM/blob/main/OracleInterface3.sol";
import "https://github.com/jrkosinski/oracle-example/blob/part2-step1/client/contracts/Ownable.sol";




contract BIMVerification is Ownable {
    address public owner = msg.sender;
    
    
    mapping(address => uint) public balances;

    struct Verification {
        bytes32 id;                        
        string discipline;                 
        string team;                       
        uint cycle;                        
        uint date;                         
        uint result;                       
    }
    
    
    function deposit() onlyOwner public payable {
        balances[msg.sender] += msg.value;
    }
    
    
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
    
    
    address internal BIMOracleAddr = 0;
    OracleInterface internal BIMOracle = OracleInterface(BIMOracleAddr); 

    
    
    
    
    function setOracleAddress(address _oracleAddress) external onlyOwner returns (bool) {
        BIMOracleAddr = _oracleAddress;
        BIMOracle = OracleInterface(BIMOracleAddr); 
        return BIMOracle.testConnection();
    }

    
    
    function getOracleAddress() external view returns (address) {
        return BIMOracleAddr;
    }
 
    
    
    
   function getVerification(bytes32 _verificationId) public view returns (
       bytes32 id,
       string discipline,
       string team,
       uint cycle,
       uint date,
       uint result) {
       
        return BIMOracle.getVerification(_verificationId);
    }
    
    
    
    function getResult(uint result) public pure returns (bool) {

        if (result >= 90) {
        return true;
    }
        else {
        revert('Payment cant be done');
    }
    }
    
    
    
    function transfer(address _receiver, uint _amount, uint _result) onlyOwner public payable {
        require(balances[msg.sender] >= _amount, "Insufficient funds");
        require(_result >=90);
        balances[msg.sender] -= _amount;
        balances[_receiver] += _amount;
    }
    
    
    
    function testOracleConnection() public view returns (bool) {
        return BIMOracle.testConnection(); 
    }
}
