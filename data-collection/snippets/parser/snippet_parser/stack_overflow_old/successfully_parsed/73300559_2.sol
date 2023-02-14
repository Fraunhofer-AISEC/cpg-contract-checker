
pragma solidity 0.6.12;

import "./FlashLoan.sol";

contract MyContract {
    address private contractOwner;

    FlashLoan private flashLoan;

    string someValue;

    constructor (address _flashLoanProvider) public payable {
        flashLoan = new FlashLoan(_flashLoanProvider);
        contractOwner = msg.sender;
    }

    function doFlashloan() public {
        require(msg.sender == contractOwner);

        address receiver = address(this);

        address[] memory assets = new address[](1);
        assets[0] = address(0xe6b8a5CF854791412c1f6EFC7CAf629f5Df1c747);

        uint256[] memory amounts = new uint256[](1);
        amounts[0] = uint256(1 ether);

        flashLoan.flashLoan(receiver, assets, amounts);
    }

    function setSomeValue(string memory _someValue) public {
        someValue = _someValue;
    }

    function getSomeValue() public view returns (string memory) {
        return someValue;
    }
}

