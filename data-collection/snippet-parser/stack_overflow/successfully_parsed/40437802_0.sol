contract MasterContract{
    bool public state = false;
    address public masterAddress;
    bool permCheck;


    
    
    mapping (uint => mapping(uint => perm)) public acl;

    
    function masterContractInit(string name,string detail){
      if(msg.sender!="0x0"){
        throw;
      }else{
        masterAddress = msg.sender;
      }
    }

    modifier onlyMasterAccess{
      if (msg.sender == masterAddress) _
      else throw;
    }
}
