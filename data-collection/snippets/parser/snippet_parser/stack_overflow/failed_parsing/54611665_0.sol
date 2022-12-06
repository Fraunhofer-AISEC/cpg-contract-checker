struct thing{
    uint a;
}
mapping(byte32 => thing) things;
insertThing(byte32 index, uint v) ... {
    things[index].a = v;
}
getThingValue(byte32 thingIndex){
    return things[thingIndex].a;
}
