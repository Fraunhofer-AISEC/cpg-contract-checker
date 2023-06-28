

pragma solidity >=0.8.2 <0.9.0;

contract Reg_SC1 
{
    struct reg_struct
    {
       
       string NVID ;
       uint[] teq_coff ;
       int degree ;
       int Cv ;
       int revoc_status ;
    }

    uint256 number ;
    

    mapping (string => reg_struct) public store_veh_reg ;

    function store_reg_details(string memory HPWi, string memory NVID, uint[] memory teq_coff, int degree, int Cv, int  revoc_status) public 
    {
        store_veh_reg[HPWi] = reg_struct(NVID, teq_coff, degree, Cv, revoc_status) ;
    }

    function retrieve_reg_details(string memory HPW) public view returns (reg_struct memory)
    {
        return store_veh_reg[HPW];
    }
}
