


pragma solidity 0.8.17;
import "@openzeppelin/contracts/utils/Address.sol";


contract Example {
    using Address for address;

    struct Voucher {
        address buyer;
    }

    function Test(Voucher calldata voucher) public payable {

        address buyer = payable(voucher.buyer);
        buyer.isContract(); 
        buyer.sendValue(2); 

    }
}

