
pragma solidity >=0.7.0 <0.9.0;

contract wasteManagement2 {
    struct Route{
        string date; 
        
        string vehicle;
        string driver; 
        string location;
        string routebinId;
    }

    mapping (uint => Route) public routes;
    uint public routeCount;

    constructor()  {
        routeCount = 0;
    }

    function setRoute(string memory _date,string memory _vehicle, string memory _driver, string memory _location, string memory _routebinId) public{
        routes[routeCount] = Route (_date,_vehicle, _driver, _location, _routebinId);
        routeCount++;
    }

    function getRoute(uint _routeCount) public view returns(Route memory){
        return routes[_routeCount];
    }
}
