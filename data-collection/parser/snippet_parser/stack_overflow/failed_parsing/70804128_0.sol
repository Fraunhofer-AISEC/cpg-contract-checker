ragma solidity >=0.4.22 <0.9.0;
import "./ICategory.sol";


contract Category is ICategory {
  
  uint256 currentIndex;
  CategoryStruct[] private categories;
  mapping(address => CategoryStruct[]) categoriesByUser;


  
  modifier onlyValidInput(CategoryInputStruct memory _input) {
    bytes memory errCode;
    bytes memory title = bytes(_input.title);

    if (title.length == 0) {
      errCode = bytes("invalidTitle");
    }

    if (errCode.length > 0) {
      revert(string(errCode));
    }
    _;
  }

  modifier onlyValidIndex(uint256 index) {
    if (isCategoryExists(index)) {
      _;
    } else {
      revert("Invalid index.");
    }
  }

  

  constructor() {
    currentIndex = categories.length;
  }

  

  
  function isCategoryExists(uint256 index) public view returns (bool) {
    if (index >= categories.length) {
      return false;
    }

    return categories[index].isExist;
  }

  
  
  function createCategory(
    CategoryInputStruct memory _input,
    LocationStruct memory _location
  ) external onlyValidInput(_input) returns (bool) {
    CategoryStruct memory newCategory = CategoryStruct({
      id: currentIndex,
      user: msg.sender,
      title: _input.title,
      isExist: true
    });

    categories.push(newCategory);
    categoriesByUser[msg.sender].push(newCategory);
    emit CategoryCreated(currentIndex);
    currentIndex++;
    return true;
  }
}

