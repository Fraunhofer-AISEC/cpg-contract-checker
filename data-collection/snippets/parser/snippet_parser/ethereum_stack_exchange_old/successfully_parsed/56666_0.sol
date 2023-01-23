
function listIncidents(uint _startID, uint _count) constant returns(uint[10] _incIDs, bytes[10] _names, bytes[10] _descriptions, bytes[10] _places, bytes[10] _times, bytes[10] _dates) {

  uint maxIters = _count;
  if((_startID + _count) > getIncidentCount()) {
  maxIters = getIncidentCount() - _startID;
  }

  _incIDs = new uint[](maxIters);
  _names = new bytes[](maxIters);
  _descriptions = new bytes[](maxIters);
  _places = new bytes[](maxIters);
  _times = new bytes[](maxIters);
  _dates = new bytes[](maxIters);

  for(uint i=0;i<maxIters;i++) {
    uint _incidentID = _startID + i;

    PoliceRecord memory r = incidents[_incidentID];
    _incIDs[i] = _incidentID;
    _names[i] = bytes(r.incName);
    _descriptions[i] = bytes(r.incDescription);
    _places[i] = bytes(r.incPlace);
    _times[i] = bytes(r.incTime);
    _dates[i] = bytes(r.incDate);
   }
}
