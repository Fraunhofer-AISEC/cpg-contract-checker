pragma solidity ^0.4.18;

contract Iceicebaby {

struct Parcel {
  string state;
  string flavour;
  uint256 weight;
  address holder;
}

Parcel[] public parcels;

function newParcel(string _flavour, uint256 _weight) public {
  parcels.length++;
  parcels[parcels.length-1].state="ORDERED";
  parcels[parcels.length-1].flavour=_flavour;
  parcels[parcels.length-1].weight=_weight;
  parcels[parcels.length-1].holder=msg.sender;
}

function getParcelsCount () view public returns (uint){
  return parcels.length;
}

function getParcel(uint256 index) view public returns (string, string, uint256, address) {
  return (parcels[index].state, parcels[index].flavour, parcels[index].weight ,parcels[index].holder);
}}
