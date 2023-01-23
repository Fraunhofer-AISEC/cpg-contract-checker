pragma solidity 0.5.11;

contract Ownable {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _new_owner) public onlyOwner {
        require(_new_owner != address(0));
        owner = _new_owner;
    }
}

contract StateContract is Ownable {
    uint256 public contractVariable = 3;
    address public proxy_contract;

    
    modifier onlyApprovedProxy() {
        require(msg.sender == proxy_contract);
        _;
    }

    function changeProxyAddress(address _proxy_contract) public onlyOwner returns(bool) {
        proxy_contract = _proxy_contract;
        return true;
    }

    function editContractVariable(uint256 _conrtactVariable) external onlyApprovedProxy returns(bool) {
         contractVariable = _conrtactVariable;
         return true;
    }

    function getContractVariable() public view returns(uint256) {
        return contractVariable;
    }
}
