   struct Route{
        uint id;
        uint date;
        string driverName;
        string routeBinId;
    }
    mapping(uint256 => Route) routes;
    
    
    function setRouteData( uint256 _date, string memory _driverName, string memory _routeBinId)
    public _ownerOnly payable {
        routes[routeId] = Route(routeId, _date, _driverName, _routeBinId);
        routeId++;
    }
    
    function getRouteData() external view _ownerOnly returns (Route[] memory){
      Route[] memory id = new Route[](routeId);
      for (uint i = 0; i < routeId; i++) {
          Route storage route1 = routes[i];
          id[i] = route1;
      }
      return id;
    }
    
    function getRouteDataBasedOnId(uint _routeId) external view _ownerOnly returns(Route memory){
        return routes[_routeId];
    }
}
