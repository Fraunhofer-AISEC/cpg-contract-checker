pragma solidity ^0.4.0;
contract Check {

mapping (uint256 => uint256) CPTPrices;

event priceAdded(uint256,uint256);



function addPrice(uint256 CPT, uint256 price) {
    CPTPrices[CPT] = price;
    priceAdded(CPT,price);
} }
