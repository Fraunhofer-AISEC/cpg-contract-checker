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

    struct PointCoords {
        pointObject P1Coords;
        pointObject P2Coords; 
        pointObject P3Coords; 
        pointObject P4Coords; 
    }

    PointCoords public pointsCoords;
    address[] public patients;
    string public name;

    function zoneObject (string name, string P1Lon, string P1Lat, string P2Lon, string P2Lat, string P3Lon, string P3Lat, string P4Lon, string P4Lat){
        name = name;
        pointsCoords.P1Coords = new pointObject(P1Lon, P1Lat);
        pointsCoords.P2Coords = new pointObject(P2Lon, P2Lat);
        pointsCoords.P3Coords = new pointObject(P3Lon, P3Lat);
        pointsCoords.P4Coords = new pointObject(P4Lon, P4Lat);
    }

    function addPatient(address patientAddress){
        patients.push(patientAddress);
    }

    function getDetails() public constant returns (string, address, address, address, address){
        return (name, pointsCoords.P1Coords pointsCoords.P2Coords, pointsCoords.P3Coords, pointsCoords.P4Coords);
    }

    function removePatient(address patient){
        if(isContract(patient)){
            for (uint i = 0; i<patients.length-1; i++){
                if(patients[i] == patient){
                    delete patients[i];
                }
            }
        }
    }

    function isContract(address addr) returns (bool) {
        uint size;
        assembly { size := extcodesize(addr) }
        return size > 0;
    }
}

contract pointObject{
    string public Lat;
    string public Lon;

    function pointObject (string Lon, string Lat){
        Lat = Lat;
        Lon = Lon;
    }
}
