

pragma solidity ^0.8.0;

contract Bank{
    
    
    address private owner;
    constructor() {
        owner=msg.sender;
    }
    mapping(address=>uint256)  accounts;
    mapping(address=>bool) public CheckAccount;
    mapping(address=>uint256) public fdAmount;
    mapping(address=>bool)  blockedAcc;
    uint fees=0.00005 ether;
    uint feesColl=0;

    
    function createAcc() public  {
        require(CheckAccount[msg.sender]==false,"Account Aleready Created Succefully");
        require(blockedAcc[msg.sender]==false,"You are blocked by the Owner");
        accounts[msg.sender]=msg.sender.balance;
        CheckAccount[msg.sender]=true;

    }

    function createFD() public payable {
        require(blockedAcc[msg.sender]==false,"You are blocked by the Owner");
        require(CheckAccount[msg.sender],"Create Account First");
        payable(address(this)).transfer(msg.value);
        payable(address(this)).transfer(fees);
        
        
        fdAmount[msg.sender]+=msg.value / 1 ether;
    }

    function getBalance(address _address) public view returns(uint256){
        require(blockedAcc[msg.sender]==false,"You are blocked by the Owner");
        
        return _address.balance / 1 ether ;
    }

    receive() external payable {}
    
    function getContractBal() public view returns(uint){
        require(blockedAcc[msg.sender]==false,"You are blocked by the Owner");
        return address(this).balance / 1 ether;

    }

    function WithdrawFD() public payable {
        require(blockedAcc[msg.sender]==false,"You are blocked by the Owner");
        
        
        payable(msg.sender).transfer(address(this).balance);
        fdAmount[msg.sender]-=msg.value / 1 ether;
    }

    function CloseAcc() public{
        require(CheckAccount[msg.sender]==true,"Account Not Exist,Create Account First");
        require(blockedAcc[msg.sender]==false,"You are blocked by the Owner");
        CheckAccount[msg.sender]=false;
        delete accounts[msg.sender];

    }

    function BlockUsr(address _add) public {
        CloseAcc();
        require(msg.sender == owner,"Only Owner Has the Permission");
        blockedAcc[_add]=true;

    }
     function UnBlockUsr(address _add) public {
        require(msg.sender == owner,"Only Owner Has the Permission");
        
        blockedAcc[_add]=false;

    }


}
