function getmappingentry(uint index, string s1) public returns (string, string)
{
    return (BCServiceList[index].cloudID, BCServiceList[index].serviceProducerMetadata[s1]);
}
