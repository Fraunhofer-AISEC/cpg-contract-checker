`pragma solidity ^0.4.4;

import "./strings.sol";

contract SDFFinance {
    using strings for *;
    address addr;
    address public driver1;
    address public driver2;
    address public driver3;
    string statusOf;
    uint coin;

function SDFFinance(uint balance) {
    coin=balance;
    driver1=0x1b7207197717fe2114d3d22f38c81d980e74e13a;
    driver2=0x1b7207197717fe2114d3d22f38c81d980e74e13a;
    driver3=0x1b7207197717fe2114d3d22f38c81d980e74e13a;
    statusOf='OPN';
  }  

function changeShipmentStatus(string shipmentId,string st){
            statusOf=st;
        processPayment();
}

function processPayment(){
    if(statusOf.toSlice().equals('RAP'.toSlice())){
        sendPayment(driver1);
    }
    else if(statusOf.toSlice().equals('DAL'.toSlice())){
        sendPayment(driver2);
    }

    else
    if(statusOf.toSlice().equals('ATD'.toSlice())){
        sendPayment(driver3);
    }
}



function sendPayment(address beneficiary) payable returns(bool success) {
  if(msg.value==0) throw;
  if(!beneficiary.send(msg.value)) throw;
  return true;
}

function getBalance() returns(uint){
    return coin; 
}

function getStatus() returns(string){
    return statusOf; 
}

function getAddress() returns(address){
    return addr; 
}

}`
