contract Trial{
    
    struct Kit{
        uint256 id;
        string description;
    }
    
    mapping (address => Kit[]) public historic;
    uint256 public kitCount = 0;
    
    function checkDuplicate(Kit memory _kit) internal{
        uint256 _id = _kit.id;
        bool _res = true;
        for(uint256 i = 0; i < historic[msg.sender].length; i++){
            if(_id == historic[msg.sender][i].id){
                _res = false;
            }
        }
        if(_res = true){
            historic[msg.sender].push(_kit);
        }
    }
    
    function addKit(string memory _description) public{
        Kit memory newKit = Kit(kitCount, _description);
        checkDuplicate(newKit);
        kitCount++;
    }
    
    function transfertKit(uint256 _id, string memory _description) public {
        Kit memory newKit = Kit(_id, _description);
        checkDuplicate(newKit);
    }
}
