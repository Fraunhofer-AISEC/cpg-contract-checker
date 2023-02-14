

pragma solidity >=0.7.0 <0.9.0;

contract Testing {

    struct Schema {
        mapping(string => string) entity;
    }

    struct SchemaMapping {
        
        
        string[] key;
        string[] value;
    }

    mapping(uint256 => Schema) schemas;
    mapping(uint256 => SchemaMapping[]) schemaMappings;

    function createSchema(uint256 id, string memory key, string memory value) public {
        SchemaMapping[] storage schemamapping = schemaMappings[id];

        schemamapping[id].key.push(key);
        schemamapping[id].value.push(value);

        schemas[id].entity[key] = value;
    }

    function getSchemaElemet(uint256 id) public view returns (SchemaMapping[] memory) {
        return schemaMappings[id];
    }
}
