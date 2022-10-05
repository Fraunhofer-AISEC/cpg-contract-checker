pragma solidity >=0.4.4 <0.6.0;



contract PetSharing {




    
    struct LovePet {
        address lovepet;
        uint lovepetwallet;
    }



    mapping (address => LovePet) LovePeter;

    
    struct Owner {
        address owner;
        string ownerName;
        string petName;
        uint ownerprice;
        string petInfo;
        string petselltext;
        uint ownerwallet;
    }


    mapping (address => Owner) Owners;
    address[] public OwnerAddresses;

    
    struct Image {
        string petImageHash;
        string ipfsInfo;
    }

    mapping (address => Image[]) private images;

    
    struct PetSitter {
        address petsitter;
        string petSittername;
        string petSitterInfo;
        string educationConfirm;
        string petsharetext;
        uint sitterprice;
        uint petsitterwallet;
    }

    mapping (address => PetSitter) PetSitters;
    address[] public PetSitterAddresses;



    
    modifier MasterInfo(address _MASTER) {
        require(_MASTER == msg.sender);
        _;
    }

    
    modifier OwnerModifyInfo(address _OWNER ) {
        require(_OWNER == msg.sender);
        _;

    }

    
    modifier PetSitterModifyInfo(address _PETSITTER) {
        require(_PETSITTER == msg.sender);
        _;

    }

    
    function RegisterMaster(address _master) public {
        LovePeter[_master].lovepet = _master;
    }

    
    function RegisterOwner(address _owner, string _ownername, string _petname, string _petInfo) public  {
         

            Owners[_owner].ownerName = _ownername;
            Owners[_owner].petName = _petname;
            Owners[_owner].petInfo = _petInfo;

            OwnerAddresses.push(_owner);

    }

    
    function RegisterPetsitter(address _petsitter, string _petsittername, string _petsitterinfo, string _education) public  {
     

        PetSitters[_petsitter].petSittername = _petsittername;
        PetSitters[_petsitter].petSitterInfo = _petsitterinfo;
        PetSitters[_petsitter].educationConfirm = _education;

        PetSitterAddresses.push(_petsitter);
    }

    
    function getOwnerAddresses() view public returns (address[]) {
        return OwnerAddresses;
    }

    
    function getOwnerInfo(address _owner) view public returns (string,string,string) {
        return(Owners[_owner].ownerName,Owners[_owner].petName,Owners[_owner].petInfo);
    }

    
    function OwnerCount() view public returns (uint) {
        return OwnerAddresses.length;
    }

    
    function getPetSitterAddresses() view public returns (address[]) {
        return PetSitterAddresses;
    }

    
    function getPetSitterInfo(address _petsitter) view public returns(string,string,string) {
        return (PetSitters[_petsitter].petSittername, PetSitters[_petsitter].petSitterInfo, PetSitters[_petsitter].educationConfirm);
    }

    
    function PetSitterCount() view public returns (uint) {
        return PetSitterAddresses.length;
    }

    
    function uploadImage(string hash, string ipfs) public {
        images[msg.sender].push(Image(hash,ipfs));
    }

    
    function PetSitterShareText(address _PETSITTER, string _petsittertext)  PetSitterModifyInfo(_PETSITTER) public view returns(string) {
      
       _petsittertext  = PetSitters[_PETSITTER].petsharetext;
        return "정상적으로 등록되었습니다";
    }

    
    function OwnerShareText(address _OWNER, string _ownersharetext) OwnerModifyInfo(_OWNER) public view  returns(string){
        _ownersharetext = Owners[_OWNER].petselltext;
        return "정상적으로 등록되었습니다";
    } 

    
    function TransactionPet(address _petsitter,address _OWNER )  OwnerModifyInfo(_OWNER) public payable {
        require(PetSitters[msg.sender].petsitterwallet >= PetSitters[_petsitter].sitterprice);
        require(PetSitters[_petsitter].sitterprice == msg.value);
    }


    
   function PetChangeTransaction(address _ownerseller, address _PETSITTER, address _MASTER, uint _ownerpirce) MasterInfo(_MASTER) PetSitterModifyInfo(_PETSITTER) public  payable {
       
       _ownerpirce = Owners[_ownerseller].ownerprice;
    
       require(_ownerpirce == msg.value);
       PetSitters[msg.sender].petsitterwallet -= _ownerpirce;
       require(PetSitters[msg.sender].petsitterwallet + _ownerpirce >= PetSitters[msg.sender].petsitterwallet);
       require(LovePeter[_MASTER].lovepetwallet + _ownerpirce >= LovePeter[_MASTER].lovepetwallet);
       LovePeter[_MASTER].lovepetwallet += msg.value;
    }

    function PetChange(address _ownerseller, address _PETSITTER, address _MASTER, uint _ownerpirce) MasterInfo(_MASTER) PetSitterModifyInfo(_PETSITTER) public {
        _ownerpirce = Owners[_ownerseller].ownerprice;
        LovePeter[msg.sender].lovepetwallet -= _ownerpirce;
        require(Owners[_ownerseller].ownerwallet + _ownerpirce >= Owners[_ownerseller].ownerwallet);

       Owners[_ownerseller].ownerwallet += msg.value;
        Owners[_ownerseller].owner = PetSitters[_PETSITTER].petsitter;
    }
     function test(address _OWNER) OwnerModifyInfo(_OWNER) public view  returns(uint){

        return  Owners[_OWNER].ownerwallet;
    }

    function test2(address _MASTER) MasterInfo(_MASTER) public view  returns(uint){

        return LovePeter[_MASTER].lovepetwallet;
    }
}

