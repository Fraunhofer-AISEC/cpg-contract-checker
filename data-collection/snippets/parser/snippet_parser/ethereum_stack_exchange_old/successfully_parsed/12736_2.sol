contract ZonesFactory {
    address[] zones;
    event LogCreatedZone(address indexed hsAddr, bytes32 name, bytes32 P1Lon, bytes32 P1Lat, bytes32 P2Lon, bytes32 P2Lat, bytes32 P3Lon, bytes32 P3Lat, bytes32 P4Lon, bytes32 P4Lat);

    function add(bytes32 name, bytes32 P1Lon, bytes32 P1Lat, bytes32 P2Lon, bytes32 P2Lat, bytes32 P3Lon, bytes32 P3Lat, bytes32 P4Lon, bytes32 P4Lat) public returns(address) {
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
        bytes32 P1Lon;
        bytes32 P1Lat;
        bytes32 P2Lon; 
        bytes32 P2Lat; 
        bytes32 P3Lon; 
        bytes32 P3Lat; 
        bytes32 P4Lon; 
        bytes32 P4Lat;
    }

    LonLat public lonLat;

    bytes32 public name;

    function zoneObject (bytes32 name, bytes32 P1Lon, bytes32 P1Lat, bytes32 P2Lon, bytes32 P2Lat, bytes32 P3Lon, bytes32 P3Lat, bytes32 P4Lon, bytes32 P4Lat){
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

    function getDetails() public constant returns (bytes32, bytes32, bytes32, bytes32, bytes32, bytes32, bytes32, bytes32, bytes32){
        return (name, lonLat.P1Lon, lonLat.P1Lat, lonLat.P2Lon, lonLat.P2Lat, lonLat.P3Lon, lonLat.P3Lat, lonLat.P4Lon, lonLat.P4Lat);
    }
}
