contract A {
function _preValidate(address beneficiary) internal view {
        require(beneficiary != address(0), "Beneficiary is the zero address");
        this; 
 }
}

contract A1 is A {

uint256 = closeTime;
 modifier onlyWhileOpen {
        require(block.timestamp < closeTime, "Operation is closed");
        _;
    }

function _preValidate(address beneficiary) internal onlyWhileOpen view {
        super._preValidate(beneficiary);
 }
}

contract A2 is A {

uint256 = openTime;
 modifier onlyAfterOpen {
        require(block.timestamp > openTime, "Operation is not open");
        _;
    }

function _preValidate(address beneficiary) internal onlyAfterOpen view {
        super._preValidate(beneficiary);
 }
}


contract B is A, A1, A2 {
    
    
    }
    
