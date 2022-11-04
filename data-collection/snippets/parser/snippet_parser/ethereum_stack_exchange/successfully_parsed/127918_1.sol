
pragma solidity >0.8.0 <0.9.0;
contract aakash4dev{
    function getBalance() public view returns (uint) {
        return address(this).balance; 
    }
}
