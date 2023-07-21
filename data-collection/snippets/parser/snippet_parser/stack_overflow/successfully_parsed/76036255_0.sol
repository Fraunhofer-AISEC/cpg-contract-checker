contract PixelPurseMarketPlace is ERC721, Ownable {
using SafeMath for uint256;

uint256 private _totalSupply;
uint256 private _nextTokenId;
address payable private _pixelPurseCharityAddress;
uint256 private _pixelPurseCharityPercentage;
address payable private _pixelPurseAddress;
uint256 private _pixelPursePercentage;

constructor() ERC721("PixelPurse", "PPTM"){
    _totalSupply = 0;
    _nextTokenId = 1;
}

function setCharityAddress(address payable pixelPurseCharityAddress) external onlyOwner 
{
    _pixelPurseCharityAddress = pixelPurseCharityAddress;
}

function viewCharityAddress() external view onlyOwner returns (address) {
    return _pixelPurseCharityAddress;
}

function setCharityPercentage(uint256 pixelPurseCharityPercentage) external onlyOwner {
    require(pixelPurseCharityPercentage >= 0, "Charity percantage must be >= 0");
    require(pixelPurseCharityPercentage <= 100, "Charity percantage must be <= 0");
    _pixelPurseCharityPercentage = pixelPurseCharityPercentage;
}

function viewCharityPercentage() external view onlyOwner returns (uint256){
    return _pixelPurseCharityPercentage;
}

function viewCharityRaisedFunds() external view onlyOwner returns (uint256) {
    return _pixelPurseCharityAddress.balance;
}

function setApplicationAddress(address payable pixelPurseAddress) external onlyOwner {
    _pixelPurseAddress = pixelPurseAddress;
}

function viewApplicationAddress() external view onlyOwner returns (address) {
    return _pixelPurseAddress;
}

function setApplicationFee(uint256 pixelPursePercentage) external onlyOwner {
    require(pixelPursePercentage >= 0, "Charity percantage must be >= 0");
    require(pixelPursePercentage <= 100, "Charity percantage must be <= 0");
    _pixelPursePercentage = pixelPursePercentage;
}

function viewApplicationFee() external view onlyOwner returns (uint256) {
    return _pixelPursePercentage;
}

function viewApplicationBalance() external view onlyOwner returns (uint256) {
    return _pixelPurseAddress.balance;
}
}
