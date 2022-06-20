import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract BookCreation is ERC721, Ownable {
    uint256 private _tokenIds;
     
    struct Book {
        string title;
        uint256 authorID;
        uint256 _bookID;
        uint256 _numMinted;
        uint256 _numEditions;
        mapping (uint256 => Edition) editions;
    }
    
    struct Edition{
        uint256 _editionID;
        uint256 _bookID;
        uint256 _numMinted;
        string editionName;
    }
    
    mapping (uint256 => Book) private books;
    
    constructor() ERC721("Book", "TLB"){
    }
}