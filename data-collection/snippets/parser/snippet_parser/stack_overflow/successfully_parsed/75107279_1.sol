      
        pragma solidity ^0.8.17;
        import "@openzeppelin/contracts/proxy/utils/Initializable.sol";
        import "@openzeppelin/contracts/access/Ownable.sol";
        import "./MCSfactory.sol";
        import "./MCSCoin.sol";
        
        contract Campaign is Ownable, Initializable {
       
        
            string internal name;
            int256 internal lat;
            int256 internal lng;
            int256 internal range;
            string internal campaignType;
        
            address public addressCrowdSourcer;
            uint256 public fileCount = 0;
            uint256 public checkedFiles = 0;
            uint256 public numberOfActiveWorkers = 0;
            uint256 public numberOfActiveVerifiers = 0;
            bool public isClosed;
        
        
            CampaignFactory internal factoryContractAddress;
            mapping(string => File) public files; 
        
            string[] public allfilesPath;
        
            struct File {
                bool status;
                bool validity;
                address  uploader;
                address verifier;
                string hash;
            }
        
            function getAllFilesInfo() public view returns(File[] memory){
                File[] memory out = new File[](allfilesPath.length);
                for(uint i = 0; i<allfilesPath.length; i++) {
                    out[i] = files[allfilesPath[i]];
                }
                return out;
            }
        
            function getValidFiles() public view onlyOwner returns(string[] memory){
                string[] memory out = new string[](allfilesPath.length);
                for(uint i; i<allfilesPath.length; i++) {
                    if ((files[allfilesPath[i]].status == true) && (files[allfilesPath[i]].validity == true)) {
                        out[i] = allfilesPath[i];
                    }
                }
                return out;
            }
        
            function getInfo() public view returns(string memory,int256,int256,int256,string memory,address,uint256) {
                return(name,lat,lng,range,campaignType,addressCrowdSourcer,fileCount);
            }
        
            constructor(string memory _name,int256 _lat,int256 _lng,int256 _range,string memory _type,address  _addressCrowdSourcer,address  _factoryAddress)  onlyOwner initializer {
                name = _name;
                lat = _lat;
                lng = _lng;
                range = _range;
                campaignType = _type;
                addressCrowdSourcer =_addressCrowdSourcer;
                factoryContractAddress = CampaignFactory(_factoryAddress);
                isClosed = false;
                transferOwnership(_addressCrowdSourcer);
            }
        
            event FileUploaded(address  uploader);
        
            function uploadFile(string memory ipfspath,int256 _fileLat,int256 _fileLng) public {
                require(msg.sender != address(0));
                require(isClosed == false,'The campaign is closed by sourcer');
                require(isInRange(_fileLat,_fileLng),'position out of area');
                fileCount++;
                numberOfActiveWorkers++;
                allfilesPath.push(ipfspath);
                files[ipfspath] = File(false,false,(msg.sender),address(0),ipfspath);
                emit FileUploaded((msg.sender));
            }
        
            function sqrt(int256 x) internal pure returns (int256 y) {
                int256 z = (x + 1) / 2;
                y = x;
                while (z < y) {
                    y = z;
                    z = (x / z + z) / 2;
                }
                return y;
            }
        
            function calculateDistance(int256 latFile, int256 lonFile) public view returns (int256 dist) {
                int256 distance = sqrt((latFile - lat)**2 + (lonFile - lng)**2);
                return int256(distance);
            }
        
            function isInRange(int256 latFile, int256 lonFile) public view returns (bool answer){
                if ((range*1000) >= calculateDistance(latFile,lonFile)) {
                    return true;
                }
                return false;
            }
        
        
            function validateFile(string memory hash) public {
                files[hash].validity = true;
                files[hash].status = true;
                files[hash].verifier = msg.sender;
                checkedFiles++;
                numberOfActiveVerifiers++;
            }
        
            function notValidateFile(string memory hash) public {
                files[hash].status = true;
                files[hash].verifier = msg.sender;
                checkedFiles++;
                numberOfActiveVerifiers++;
            }
        
            function getCampaignBalance() public view returns(uint256 balance) {
                return coin.balanceOf(address(this));
            }
        
            function closeCampaign() public {
                require(msg.sender == addressCrowdSourcer,'you are not the owner');
                require(msg.sender != address(0), "invalid address provided");
                isClosed = factoryContractAddress.closeCampaign();
            }
       
        }

