pragma solidity ^0.6.8;
contract MyFund {

    mapping(address => Investor) public investors;
    address public manager;

    constructor(
        string memory _fundName,
        uint256 _installmentAmount,
        uint256 _numOfInstallments,
        uint256 _noOfInvestors
    ) public {
        fundName = _fundName;
        numOfInstallments = _numOfInstallments;
        noOfInvestors = _noOfInvestors;
        manager = msg.sender;
        installmentAmount = _installmentAmount * 1e18;
        jackpot = SafeMath.mul(installmentAmount, noOfInvestors);
    }

    modifier isManager() {
        require(msg.sender == manager, "Only the manager can access this function");
        _;
    }

    function checkIfManager() public view returns (bool) {
        if(msg.sender == manager){
            return true;
        } else {
            return false;
        }
    }
.
.    
.
