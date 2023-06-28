contract People{
    bool public isActive = false;
    uint public objectId;
    string public ownerName;
    string somePrivateData;
    mapping (address => bool) owned;

    function initPeopleContract(string name){
        if (!isActive) {
            isActive = true;
            ownerName = name;
        }
    }

    function getOwnerName() returns (string val) {
        if (!isActive) {
          val = ownerName;
        }else {
          val = "Account Deactivated";
        }
    }

    function getPrivateData() returns (string data) {
        if (msg.sender == address){
          
        } else {
          
        }
    }
}
