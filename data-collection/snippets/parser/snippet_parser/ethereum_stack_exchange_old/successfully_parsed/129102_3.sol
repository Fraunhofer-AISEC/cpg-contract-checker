
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MintWithERC20 {
   struct Persona{
        string Nombre;
        uint Edad;
    }

    mapping (uint => Persona) RelacionID;

    function GuardarID(uint ID, string memory NombrePersona, uint EdadPersona) public{
        RelacionID[ID] = Persona(NombrePersona, EdadPersona);
    }

    function VerPersona(uint verID) public view returns(Persona memory){
        return RelacionID[verID];
    }
} 
