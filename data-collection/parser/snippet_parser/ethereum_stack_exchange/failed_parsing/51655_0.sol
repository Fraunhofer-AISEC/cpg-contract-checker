struct Student{
    bytes32 PatietRecordHash;
    bool isExists;
    bytes32[] ReportIpfsHash;
}
event LogStudentReportLength(uint noOfReports);
function addStudentReport(bytes32 _StudentId,bytes32 _ReportIpfsHash)public returns(bool){
    require(msg.sender == systemAdmin);

   emit LogStudentReportLength(Students[_StudentId].ReportIpfsHash.push(_ReportIpfsHash));
   uint length= getNoOfLabReports(_StudentId);
   Students[_StudentId].ReportIpfsHash[length-1]=_ReportIpfsHash;
   emit LogNewStudentLabReport(true,_ReportIpfsHash,patients[_patientId].ReportIpfsHash.length);
   return true;
}
