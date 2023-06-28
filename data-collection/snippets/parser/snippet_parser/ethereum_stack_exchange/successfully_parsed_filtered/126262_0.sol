pragma solidity >=0.4.16 <0.7.0;

contract Rental {

   function retrieve_resource() external payable {
        (bool success, bytes memory returnData) = sender.call{value: 1 wei}("");
        require(success);
    }
}
