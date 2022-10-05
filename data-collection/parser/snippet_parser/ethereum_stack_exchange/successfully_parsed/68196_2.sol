function records(uint key) external view returns (uint, uint, uint) {
    return (records[key].x, records[key].y, records[key].z);}
