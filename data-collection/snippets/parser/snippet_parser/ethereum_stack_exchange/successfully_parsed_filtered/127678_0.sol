contract InteractWithLibraries{
address s_linkedLibraryAddress;

function linkLibrary(address _libraryAddress) public {
require(_libraryAddress != address(0), "invalid address");
  s_linkedLibraryAddress = _libraryAddress
}

function doSthWithLibrary() public view{
 
 libraryImpl localUsedLibrary = libraryImpl(s_linkedLibraryAddress);
 localUsedLibrary.doSth();
}

}

abstract contract libraryImpl {

function doSth() public view;
}
