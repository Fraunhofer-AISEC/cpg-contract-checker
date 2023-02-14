      
function storeTeacherDetails(
    uint256 tsc,
    bytes32 surname,
    bytes32 firstName,
    bytes32 lastName,
    bytes32 birthdate,
    bytes32 gender,
    uint256 nationalID,
    bytes32 life,
    uint phone,
    bytes32 postalAddress,
    uint currentSchool,
    bytes32 reportingDate,
    bytes32 subject1,
    bytes32 subject2,
    bytes32 email
) public {
      teachers[teacherRecords.length]=PersonalInfo({tsc:tsc,
      surname:surname,
      firstName:firstName,
      lastName:lastName,
      birthdate:birthdate,
      gender:gender,
      nationalID:nationalID,
      life:life,
      phone:phone,
      postalAddress:postalAddress,
      currentSchool:currentSchool,
      reportingDate:reportingDate,
      subject1:subject1,
      subject2:subject2,
      email:email});
}
