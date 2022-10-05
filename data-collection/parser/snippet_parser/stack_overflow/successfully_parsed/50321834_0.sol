    pragma solidity^0.4.19;

contract Dan_v1_1 {
    struct DanInfo {
        string file_path;
        string kor_name;
        string personal_key;
        string eng_name;
        uint8 gradeOfpoomDan;
        string danCertificate;
        uint[] regDateHistory;
        bool flag;
    }

    mapping (string => DanInfo) danInfo;
    mapping (uint => string) indexOfDanInfo;
    uint private danInfoCount = 0;

    address contractOwner;

    function Dan_v1_1() public{
        contractOwner = msg.sender;
    }

    function setInitDanInfo (string file_path,string kor_name, string personal_key,string eng_name,
        uint8 gradeOfpoomDan,string danCertificate, uint []regDateHistory, bool flag) 
        public{
        require (keccak256(danInfo[personal_key].personal_key) != keccak256(personal_key));
        danInfo[personal_key] = DanInfo(file_path,kor_name, personal_key,eng_name,gradeOfpoomDan,danCertificate,regDateHistory,flag);
        indexOfDanInfo[danInfoCount++] = personal_key;
    }

    function getDanInfoCount () public constant returns(uint) {
        return danInfoCount;
    }

    function getDanInfo (string personal_key) public constant returns(string,string, string, string, uint8, string, uint[], bool) {
        DanInfo memory temp = danInfo[personal_key];
        return(temp.file_path,temp.kor_name, temp.personal_key, temp.eng_name, temp.gradeOfpoomDan, temp.danCertificate, temp.regDateHistory, temp.flag);
    }

    function killContract() public{
        if(contractOwner == msg.sender) {
            selfdestruct(contractOwner);
        }
    }
}
