function Product(bytes32 _name, bytes32 _additionalInformation, 
      address[] _parentProducts, int _lon, int _lat, address _DATABASE_CONTRACT, address _PRODUCT_FACTORY) {
name = _name;
isConsumed = false;
parentProducts = _parentProducts;
additionalInformation = _additionalInformation;

DATABASE_CONTRACT = _DATABASE_CONTRACT;
PRODUCT_FACTORY = _PRODUCT_FACTORY;

Action memory creation;
creation.handler = msg.sender;
creation.description = "Product creation";
creation.lon = _lon;
creation.lat = _lat;
creation.timestamp = now;
creation.blockNumber = block.number;

actions.push(creation);

Database database = Database(DATABASE_CONTRACT);
database.storeProductReference(this);
 }
