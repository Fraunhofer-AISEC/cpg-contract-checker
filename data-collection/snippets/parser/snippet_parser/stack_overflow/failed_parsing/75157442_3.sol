
let ARRAY_SLOT = 3;


let ITEM_SLOT = 0;


let length = BigInt(await getStorageAt(ARRAY_SLOT));


let location = BigInt(keccak256(encodePacked(ARRAY_SLOT))) + BigInt(ITEM_SLOT);
let memory = await getStorageAt(location);
