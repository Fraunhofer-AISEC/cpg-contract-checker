
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Token is LipToken, ERC20, Ownable {

   **LipToken lp;** 

   uint max_supply = 10002000000000000000000;

    constructor() ERC20("Franco", "FTK") {
        _mint(msg.sender, 10000 * 10 ** decimals());
        
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function number() public view returns(uint256){
        return 1 * 10 ** decimals();
    }

    **function jugar(uint256 _lipId) external {
    require(totalSupply() < max_supply, "Ya se exidio el total supply, no se puede emitir mas");
    lp.getLip(_lipId);
    _mint(msg.sender, 1 * 10 ** decimals());
    }**
 
}



contract LipToken is ERC721, Ownable {

    
    constructor (string memory _name, string memory _symbol)
    ERC721(_name, _symbol) {
        
    }

    
    

    
    uint256 COUNTER;
    
    uint256 fee = 0.1 ether;
    
    struct Lip {
        string name;
        uint256 id;
        uint256 dna;
        uint8 level;
        uint8 rarity;
    }
    
    Lip [] public lips;
    
    event NewLip(address indexed owner, uint256 id, uint256 dna);

    
    

    
    function _createRandomNum(uint256 _mod) internal view returns (uint256) {
        uint256 randomNum = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender)));
        return randomNum % _mod; 
    }

    
    function updateFee(uint256 _fee) external onlyOwner {
        fee = _fee;
    }

    
    function withdraw() external payable onlyOwner {
        address payable _owner = payable(owner());
        _owner.transfer(address(this).balance);
    }

    
    function _createLip(string memory _name) internal {
        uint8 randRarity = uint8(_createRandomNum(100));
        uint randDna = _createRandomNum(10**16);
        Lip memory newLip = Lip(_name, COUNTER, randDna, 1, randRarity);
        lips.push(newLip);
        _safeMint(msg.sender, COUNTER);
        emit NewLip(msg.sender, COUNTER, randDna);
        COUNTER++;
    }

    
    
    function createRandomLip(string memory _name) public payable {
        require(msg.value >= fee);
        _createLip(_name);
    }

    
    function getLips() public view returns (Lip [] memory) {
        return lips;
    }

    
    function moneySmartContract() public view returns (uint256){
        return address(this).balance;
    }

    
    function addressSmartContract() public view returns (address) {
        return address(this);
    }

    
    function getOwnerLips() public view returns (Lip [] memory) {
        Lip [] memory result = new Lip [] (balanceOf(msg.sender));
        uint256 counter = 0;
        for (uint256 i = 0; i <lips.length; i++) {
            if (ownerOf(i) == msg.sender) {
                result[counter] = lips[i];
                counter++;
            }
        }
        return result;
    }

    
    function levelUp(uint256 _lipId) public {
        require(ownerOf(_lipId) == msg.sender);
        Lip storage lip = lips[_lipId];
        lip.level++;
    }

    
    function getLip(uint256 _lipId) public view returns (uint256){
        require(ownerOf(_lipId) == msg.sender, "No existe ese LIP o no pertenece al usuario");
        Lip storage lip = lips[_lipId];
        return _lipId;
    }


}
