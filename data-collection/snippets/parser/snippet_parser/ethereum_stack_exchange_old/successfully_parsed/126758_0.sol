pragma solidity >=0.4.22 <0.9.0;

contract Obdrs {

    uint public regCount;
    uint256 dateOfBirth; 
    string gender;
    string fullName;
    string placeOfBirth;
    string motherFullname;
    string motherNrc;
    string fatherFullname;
    string fatherNrc;
    string bo; 
    string permanentAddress; 
    string contactNumber;
    

    struct form1 {

    uint256 dateOfBirth; 
    string gender;
    string fullName;
    string placeOfBirth;
    string motherFullname;
    string motherNrc;
}    
    struct form2 {
    string fatherFullname;
    string fatherNrc;
    string bo; 
    string permanentAddress; 
    string contactNumber;
    
}

          mapping(uint => form1) public forms1;
          mapping(uint => form2) public forms2;

        event formsReg1(
    uint id,
    uint256 dateOfBirth, 
    string gender,
    string fullName,
    string placeOfBirth,
    string motherFullname,
    string motherNrc
  );     

      event formsReg2(
    uint id,
    string fatherFullname,
    string fatherNrc,
    string bo, 
    string permanentAddress, 
    string contactNumber
    

  );


    function storeBirthCertificate1(uint256 _dateOfBirth, string memory _gender, 
    string memory _fullName, string memory _placeOfBirth, string memory _motherFullname, 
    string memory _motherNrc) public {

            regCount ++;
    forms1[regCount] = form1(_dateOfBirth, _gender, _fullName,
                             _placeOfBirth, _motherFullname, _motherNrc);
    emit formsReg1(regCount, _dateOfBirth, _gender, _fullName,
                             _placeOfBirth, _motherFullname, _motherNrc);


    }

     function storeBirthCertificate2(string memory _fatherFullname,
    string memory _fatherNrc, string memory _bo, string memory _permanentAddress, 
    string memory _contactNumber) public {

            regCount ++;
    forms2[regCount] = form2(_fatherFullname, _fatherNrc, _bo,
                             _permanentAddress, _contactNumber);
    emit formsReg2(regCount, _fatherFullname, _fatherNrc, _bo,
                             _permanentAddress, _contactNumber);


    }


}