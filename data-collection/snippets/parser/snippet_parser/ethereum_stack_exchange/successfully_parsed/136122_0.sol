
pragma solidity ^0.8.16;

contract Contract {

    function getGasPrice() public view returns (uint256) {
        uint256 gasPrice;
        assembly {
            gasPrice := gasprice()
        }
        return gasPrice;
    }

}

