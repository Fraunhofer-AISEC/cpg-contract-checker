
    pragma solidity 0.6.0;

    contract A {
        uint public total;

        receive() external payable {
            total = address(this).balance;
        }
    }

