 function registerMovement (string memory originMachine, string memory destinyMachine, string memory newWorker, ProductQuantity[] memory products) public {
    

    Movement memory newMovement = Movement({
        originMachine: originMachine,
        destinationMachine: destinyMachine,
        responsibleWorker: newWorker,
        product: products
    });

    movements.push(newMovement);
}
