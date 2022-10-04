contract ZonesFactory {
    address[] zones;
    event LogCreatedZone(address indexed hsAddr, string name, string P1Lon, string P1Lat, string P2Lon, string P2Lat, string P3Lon, string P3Lat, string P4Lon, string P4Lat);

    function add(string name, string P1Lon, string P1Lat, string P2Lon, string P2Lat, string P3Lon, string P3Lat, string P4Lon, string P4Lat) public returns(address) {
        zoneObject newZone = new zoneObject(name, P1Lon, P1Lat, P2Lon, P2Lat, P3Lon, P3Lat, P4Lon, P3Lat);
        zones.push(newZone);
        LogCreatedZone(newZone,name, P1Lon, P1Lat, P2Lon, P2Lat, P3Lon, P3Lat, P4Lon, P3Lat);
        return newZone;
    }

    function getOrgAtIndex(uint index) public constant returns(address org){
        return zones[index];
    }

    function getOrganizationCount() public constant returns(uint count) {
        return zones.length;
    }
}

contract zoneObject {

    struct LonLat {
        string P1Lon;
        string P1Lat;
        string P2Lon; 
        string P2Lat; 
        string P3Lon; 
        string P3Lat; 
        string P4Lon; 
        string P4Lat;
    }

    LonLat public lonLat;

    string public name;

    function zoneObject (string name, string P1Lon, string P1Lat, string P2Lon, string P2Lat, string P3Lon, string P3Lat, string P4Lon, string P4Lat){
        name = name;
        lonLat.P1Lon = P1Lon;
        lonLat.P1Lat = P1Lat;
        lonLat.P2Lon = P2Lon;
        lonLat.P2Lat = P1Lat;
        lonLat.P3Lon = P3Lon;
        lonLat.P3Lat = P3Lat;
        lonLat.P4Lon = P4Lon;
        lonLat.P4Lat = P4Lat;
    }

    function getDetails() public constant returns (string, string, string, string, string, string, string, string, string){
        return (name, lonLat.P1Lon, lonLat.P1Lat, lonLat.P2Lon, lonLat.P2Lat, lonLat.P3Lon, lonLat.P3Lat, lonLat.P4Lon, lonLat.P4Lat);
    }
}
