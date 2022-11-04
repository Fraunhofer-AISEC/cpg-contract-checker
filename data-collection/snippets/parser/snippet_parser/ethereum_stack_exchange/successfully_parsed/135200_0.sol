pragma solidity >=0.5.0 <0.6.0;
import "./farm.sol";
import "./manufacturer.sol";
contract Test is Farm, Manufacturer{

struct Item {

Farmer[] farmers;

string manufacturerName;
string manufacturerDate;

string distributorDate;
string distributorName;
}


Farmer [] public globalFarmers;
Item[] public items;
}