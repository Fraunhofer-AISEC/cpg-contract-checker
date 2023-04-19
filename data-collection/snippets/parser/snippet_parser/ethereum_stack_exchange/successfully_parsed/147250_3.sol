
pragma solidity ^0.8.14;

import "@openzeppelin/contracts/interfaces/IERC20.sol";

contract Popcorn {
    
    struct BorrowService {
        address lenderAddress;
        address borrowToken;
        uint256 lenderBalance;
        uint256 borrowAmount;
        address nftCollateral;
        uint256 borrowPeriod;
        uint256 serviceID;
    }

    mapping(uint256 => BorrowService) public borrowingServices;

    uint256 public numberOfBorrowingServices = 0;

    function createBorrowerCentricService (address _borrowToken) public returns (uint256) {
        BorrowService storage borrowService = borrowingServices[numberOfBorrowingServices];

        ++numberOfBorrowingServices;

        borrowService.lenderAddress = msg.sender;
        borrowService.borrowToken = _borrowToken;

        if (borrowService.borrowToken != 0x0000000000000000000000000000000000000000) {
            borrowService.lenderBalance = IERC20(_borrowToken).balanceOf(msg.sender);
        } else {
            borrowService.lenderBalance = (msg.sender).balance;
        }
        
        borrowService.borrowAmount = 0;
        borrowService.nftCollateral = 0x0000000000000000000000000000000000000000;
        borrowService.borrowPeriod = 0;
        borrowService.serviceID = numberOfBorrowingServices - 1;
     
        return numberOfBorrowingServices - 1;

    }

    function getServices() public view returns (BorrowService[] memory) {
        BorrowService[] memory borrowService = new BorrowService[](numberOfBorrowingServices);

        for (uint256 i = 0; i < numberOfBorrowingServices; ++i) {
            BorrowService storage item = borrowingServices[i];
            borrowService[i] = item;
        }
        
        return borrowService;
    }
}
