import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./Ownable.sol";

contract Testing is ERC721URIStorage, Ownable {
    address public thecreator;
    address payable _owner;
    string private title;


    constructor(string memory _title, string memory _unitName, address _creator) ERC721(_title, _unitName) {
        title = _title;
        thecreator = _creator;
        transferOwnership(payable(thecreator)); 
    }

 function transferOwnership(address _newOwner) public onlyOwner {
              _owner = payable(_newOwner);  
          }
}
