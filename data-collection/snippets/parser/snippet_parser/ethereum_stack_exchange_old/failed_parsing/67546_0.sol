For Example:
Patient.sol
contract Patient {
         mapping(address=>doctorStruct[]) public doctorDetails;
         struct doctorStruct {
             address doctorAccountAddr;
             bool canAddData;
         }
}
