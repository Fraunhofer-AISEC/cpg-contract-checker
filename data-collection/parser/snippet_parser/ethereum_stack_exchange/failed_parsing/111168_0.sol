contract MyContract {

 string memory public _defaultVersion ="1.0.0"

 function addParameter(string memory paramName) public {
    addParameter(paramName, _defaultVersion);
 }

 function addParameter(string memory paramName, string memory version) public {
    [code to add a parameter]
 }
}
