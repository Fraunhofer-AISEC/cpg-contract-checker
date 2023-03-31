import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


contract GoTekERC721 is ERC721, Ownable {

    constructor() ERC721("Go NFT", "GoN") {}

    
    mapping(address => uint256[]) public phones;
    
    
    mapping(uint256 => uint256) public balance;
    

    function register(uint256 phone, uint256 Balance) public {
        _mint(msg.sender, phone);
        phones[msg.sender].push(phone);
        balance[phone] = Balance;
    }

    
     function details(address owner) public view returns(string memory) {

        uint256[] memory ownerPhones = phones[owner];
        string memory var1;
        string memory var2;

        for (uint256 i = 0; i < ownerPhones.length; i++) {
            uint256 phone = ownerPhones[i];
            mapping(uint256 => uint256) storage userBalances=balance;
             var1=Strings.toString(userBalances[phone]);
             var2=Strings.toString(balance[phone]);
         }
        
         return string(bytes.concat(bytes(var1),":",bytes(var2))); 
    }
}
