pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';
import 'openzeppelin-solidity/contracts/math/SafeMath.sol';

import './Grocery.sol';

contract GroceryFactory is Ownable {
    using SafeMath for uint256;

    address[] public m_arGroceries;
    address public m_aMaintenanceAddress;
    address public m_aFeesAddress;
    uint256 public m_uPrice;

    constructor(address maintenanceAddress, address feesAddress, uint256 price) public payable{
        m_aMaintenanceAddress = maintenanceAddress;
        m_aFeesAddress = feesAddress;
        m_uPrice = price;
    }

    function getMaintenanceAddress() public onlyOwner view returns(address){
        return m_aMaintenanceAddress;
    }

    function setMaintenanceAddress(address maintenanceAddress)public onlyOwner {
        m_aMaintenanceAddress = maintenanceAddress;
    }

    function getFeesAddress() public onlyOwner view returns(address){
        return m_aFeesAddress;
    }

    function setFeesAddress(address feesAddress)public onlyOwner {
        m_aFeesAddress = feesAddress;
    }

    function setPrice(uint256 price) public onlyOwner {
        m_uPrice = price;
    }

    function getPrice() public view returns(uint256){
        return m_uPrice;
    }

    function getGroceriesCount() public onlyOwner view returns(uint){
        return m_arGroceries.length;
    }

    function getPools() public onlyOwner view returns(address[]){
        return m_arGroceries;
    }

    function () external payable {
        createGrocery();
    }

    function createGrocery() public payable returns(address){
        require(msg.sender != address(0), "Owner is null");
        require(msg.value == getPrice(), "Please send the deployment price");
        require(m_aMaintenanceAddress != address(0), "Maintenance address is null");
        require(m_aFeesAddress != address(0), "Fees address is null");

        address owner = msg.sender;

        Grocery groc = new Grocery(owner, m_aMaintenanceAddress);
        m_arGroceries.push(groc);

        transferFees();

        return pool;
    }

    function transferFees() private{
        uint256 balance = address(this).balance;

        if(balance > 0){
            m_aFeesAddress.transfer(balance);
        }
    }
}
