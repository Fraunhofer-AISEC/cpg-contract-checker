

pragma solidity ^0.8.9;

contract Program {

    address public funder;
    string[] public suppliers;
    string[] public buyers;
    uint public totalAmountProgram;
    uint public balance;
    uint public autoApproveLimit = 0;
    uint public fundingFee;

    bool public isActive;

    constructor(address _funder, uint _totalAmountProgram, uint _fundingFee) {
        funder = _funder;
        totalAmountProgram = _totalAmountProgram;
        balance = _totalAmountProgram;
        fundingFee = _fundingFee;
    }

    function activateProgram() public returns (bool) {
        isActive = true;
        return isActive;
    }

    function doSomethingToCheckBalanceAndDeactivateProgram() public {
        isActive = false;
    }

    function addSupplier(string memory _supplier) public {
        suppliers.push(_supplier);
    }

    function removeSupplier(string memory _supplier) public {
        for(uint i = 0; i < suppliers.length - 1; i++) {
            if (keccak256(abi.encodePacked(suppliers[i])) == keccak256(abi.encodePacked(_supplier))) {
                suppliers[i] = suppliers[suppliers.length - 1];
            }
        }

        suppliers.pop();
    }

    function getSuppliers() public view returns (string[] memory) {
        return suppliers;
    }

    function addBuyer(string memory _buyer) public {
        buyers.push(_buyer);
    }

    function removeBuyer(string memory _buyer) public {
        for(uint i = 0; i < buyers.length - 1; i++) {
            if (keccak256(abi.encodePacked(buyers[i])) == keccak256(abi.encodePacked(_buyer))) {
                buyers[i] = buyers[buyers.length - 1];
            }
        }

        buyers.pop();
    }

    function getBuyers() public view returns (string[] memory) {
        return buyers;
    }

    function updateAutoApprovalLimite(uint _autoApproveLimit) public returns (uint) {
        if (_autoApproveLimit < totalAmountProgram) {
            autoApproveLimit = _autoApproveLimit;
        }

        return autoApproveLimit;
    }

    function updateFundingFee(uint _fundingFee) public returns (uint) {
        fundingFee = _fundingFee;
        return fundingFee;
    }
}
