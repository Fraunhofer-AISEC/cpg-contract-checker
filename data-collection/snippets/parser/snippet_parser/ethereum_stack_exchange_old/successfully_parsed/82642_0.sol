pragma solidity >=0.4.21 <0.7.0;

contract Insurance {

    address payable public contractOwner;

    struct InsuranceTaker {
        string name;
        string vehicleNo;
        address insuranceTakerAddress;
        bool policyValid;
        uint lastPayment;
    }

    constructor() public {
        
        
        contractOwner = msg.sender;
    }

    mapping(address => InsuranceTaker) public insuranceTakers;

    
    uint public policyPeriod = 30;

    function signUp(string memory _name, string memory _vehicleNo) public payable returns(uint) {
        
        require(msg.sender.balance > 10 ether, "Not enough ether!");
        
        InsuranceTaker storage customer = insuranceTakers[msg.sender];
        customer.name = _name;
        customer.vehicleNo = _vehicleNo;
        customer.insuranceTakerAddress = msg.sender;
        
        
        
        contractOwner.transfer(getPremium());
        customer.policyValid = true;
        customer.lastPayment = now;
        return (200);
    }

    
    function getPremium() public payable returns(uint256) {
        
        
        return 1 ether;
    }

    
    function isInsured(address insuranceTaker) public view returns(bool) {
        InsuranceTaker storage customer = insuranceTakers[insuranceTaker];
        return (customer.policyValid && (customer.lastPayment + policyPeriod < now));
    }

    
    
    
    
    
    
    
    

    uint public damageAmount = 2 ether;



    
    function payPremium(address insuranceTaker) public payable {
        InsuranceTaker storage customer = insuranceTakers[insuranceTaker];
        require(isInsured(insuranceTaker),"err2");
        
        require(msg.value == getPremium(),"err3");
        contractOwner.transfer(msg.value);
        customer.policyValid = true;
        customer.lastPayment = now;
    }

    
    function claim() public payable {
        require(isInsured(msg.sender),"sorry signup for the policy first!");
        msg.sender.transfer(damageAmount);
    }
}
