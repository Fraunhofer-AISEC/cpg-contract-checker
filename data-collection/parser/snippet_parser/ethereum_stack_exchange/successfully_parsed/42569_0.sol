pragma solidity ^0.4.16;

contract BCSchema {

struct DefinitionV1{
   uint16   version;

   address adrs;
   uint8   id;
   string  name;
   string  description;
   string  bytecode;
 } 

struct DefinitionV2{
   uint16   version;

   address adrs;
   uint8   id;
   string  name;
   string  description;
   string  bytecode;
   string  ABI;
 }
}
