GeoData[] public geoData;
mapping(uint => uint) idIndexMap; 

function getGeoData(uint256 id) public view returns (GeoData memory) {
  uint256 index = idIndexMap[id];
  return geoData[index];
}

function paginatedGetGeoData(uint256 offset, uint256 count) public view returns (GeoData[] memory) {
  GeoData[] memory data = new GeoData[](count);
  for (uint256 i = 0; i < count; i++) {
    data[i] = geoData[offset + i];
  }
  return data;
}
