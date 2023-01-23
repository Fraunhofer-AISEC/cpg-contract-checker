    pragma solidity ^0.4.4;
import "./strings.sol";


contract XFinance {
   using strings for *;

    address addr;
   uint coin;
   Shipment shipment;

function XFinance(uint balance) {
    coin=balance;
    shipment=new Shipment();

  }  



function changeShipmentStatus(string shipmentId,string st,address driverAddress){

            shipment.setShipmentId(shipmentId);
            shipment.setStatusOfShipment(st);
        processPayment(driverAddress);
}

function processPayment(address driverAddress){
    string currentStatus=shipment.getStatusOfShipment();
    if(currentStatus.toSlice().equals('RAP'.toSlice())){
        shipment.setAddressOfDiver1(driverAddress);
        sendPayment(driverAddress);
    }
    else if(currentStatus.toSlice().equals('DAL'.toSlice())){
        shipment.setAddressOfDiver2(driverAddress);
        sendPayment(driverAddress);
    }

    else
    if(currentStatus.toSlice().equals('ATD'.toSlice())){
        shipment.setAddressOfDriver3(driverAddress);
        sendPayment(driverAddress);
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
    return shipment.statusOfShipment;
}

function getAddress() returns(address){
    return addr; 
}

}


contract Shipment{
    string public shipmentId;
    string public statusOfShipment;
    address public driver1;
    address public driver2;
    address public driver3;

    function Shipment(){}


    function setShipmentId(string shId){
    shipmentId=shId;
    }
    function getShipmentId() returns(string){
    return shipmentId;
    }

    function setStatusOfShipment(string st){
    statusOfShipment=st;
    }
    function getStatusOfShipment() returns(string){
    return statusOfShipment;
    }

    function setAddressOfDriver1(address d1){
    driver1=d1;
    }
    function getAddressOfDriver1() returns(address){
    return driver1;
    }

    function setAddressOfDriver2(address d2){
    driver2=d2;
    }
    function getAddressOfDriver2() returns(address){
    return driver2;
    }

    function setAddressOfDriver3(address d3){
    driver3=d3;
    }
    function getAddressOfDriver3() returns(address){
    return driver3;
    }
}
