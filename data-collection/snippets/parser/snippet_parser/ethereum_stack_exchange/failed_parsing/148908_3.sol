(uint8[] memory typeDays1,uint16[] memory stock1) = generateTypeDaysAndStock(2, 10);
        setStock(1, typeDays1, stock1);

function generateTypeDaysAndStock(uint8 start, uint8 end) internal pure returns (uint8[] memory, uint16[] memory) {
        require(start < end, "Invalid range");

        uint8 length = end - start + 1;
        uint8[] memory typeDays = new uint8[](length);
        uint16[] memory stock = new uint16[](length);

        for (uint8 i = start; i <= end; i++) {
            typeDays[i-start] = i;
            stock[i-start] = i;
        }

        return (typeDays, stock);
    }


