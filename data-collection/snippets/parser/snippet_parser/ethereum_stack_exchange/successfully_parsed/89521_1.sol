contract SupChainTest{
SupChain supChainInstance;

function beforeAll() public {
    supChainInstance = new SupChain();
    supChainInstance.addKit(123456789, 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,
                            "2x Covid test",-5, 15, 18011998,"Castres");
}

function checkInitialKitList() public returns (bool){
    return Assert.equal(supChainInstance.getListNumber(), 1, "Initial kit was not added correctly to the list");
}

function checkInitialUpdateNumber() public returns (bool){
    return Assert.equal(supChainInstance.getUpdateNumber(0), 0, "Initial kit' status was not added correctly to the kit list");
}

function checkInitialKitValues() public{
    Assert.equal(supChainInstance.getKitUpdate(0), 0, "Initial kit's update value is not correct");
    Assert.equal(supChainInstance.getKitBarcode(0), 123456789, "Initial kit's barcode value is not correct");
    Assert.equal(supChainInstance.getKitOwner(0), 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, "Initial kit's owner value is not correct");
    Assert.equal(supChainInstance.getKitInventory(0), "2x Covid test", "Initial kit's inventory list is not correct");
    Assert.equal(supChainInstance.getKitTemperatureMinimal(0), -5, "Initial kit's minimal temperature value is not correct");
    Assert.equal(supChainInstance.getKitTemperatureMaximal(0), 15, "Initial kit's maximal temperature value is not correct");
    Assert.equal(supChainInstance.getKitExpirationDate(0), 18011998, "Initial kit's expiration date value is not correct");
    Assert.equal(supChainInstance.getKitLastDestination(0), "Castres", "Initial kit's last destination  is not correct");
}

function checkInitialStatusValues() public {
    Assert.equal(supChainInstance.getStatusDevice(0,0), "XXX", "Initial status' iot device is not correct");
    Assert.equal(supChainInstance.getStatusLocation(0,0), "XXX", "Initial status' location is not correct");
    Assert.equal(supChainInstance.getStatusTemperature(0,0), 0, "Initial status' temperature value is not correct");
    Assert.equal(supChainInstance.getStatusDestination(0,0), "XXX", "Initial status' destination is not correct");
}

function testStoreKit() public{
    try supChainInstance.storeKit(0,"Madrid",10,"D-001"){
        Assert.equal(supChainInstance.getKitUpdate(0), 1, "Kit's update value is not correct");
        Assert.equal(supChainInstance.getStatusDevice(0,1), "D-001", "Status' iot device is not correct");
        Assert.equal(supChainInstance.getStatusLocation(0,1), "Madrid", "Status' location is not correct");
        Assert.equal(supChainInstance.getStatusTemperature(0,1), 10, "Status' temperature value is not correct");
    }catch {
        Assert.ok(false, 'Failed unexpected');
    }
}

function testShipKit() public{
    try supChainInstance.shipKit(0,"Monaco",8,"D-002","Castres"){
        Assert.equal(supChainInstance.getKitUpdate(0), 2, "Kit's update value is not correct");
        Assert.equal(supChainInstance.getStatusDevice(0,2), "D-002", "Status' iot device is not correct");
        Assert.equal(supChainInstance.getStatusLocation(0,2), "Monaco", "Status' location is not correct");
        Assert.equal(supChainInstance.getStatusTemperature(0,2), 8, "Status' temperature value is not correct");
        Assert.equal(supChainInstance.getStatusDestination(0,2), "Castres", "Initial status' destination is not correct");
    }catch{
        Assert.ok(false, 'Failed unexpected');
    }
}
}
