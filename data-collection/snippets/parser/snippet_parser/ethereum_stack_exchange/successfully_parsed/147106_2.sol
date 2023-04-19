contract ErrorTest{
error CustomError(string m);
function revertWithError() public {
    0x5B38Da6a701c568545dCfcB03FcB875f56beddC4.call{value: 0}("");
    revert CustomError("this is a custom error revert ");
}
function revertWithErrorViewFunction() public view {
    revert CustomError("this is a custom error revert on a view function");
}
function revertWithRequireView() public view {
    require(0==1, "this is a view function revert with require");
}
function revertWithRequire() public {
    0x5B38Da6a701c568545dCfcB03FcB875f56beddC4.call{value: 0}("");
    require(0 == 1, "this is a state modifying function with a revert with require");
}
}