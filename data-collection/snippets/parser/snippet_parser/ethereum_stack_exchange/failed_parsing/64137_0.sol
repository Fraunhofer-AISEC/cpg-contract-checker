it('addSupplier', async () => {
        
        const result = await contract.addSupplier(supplier1, 'Supplier 1');

        
        assert.lengthOf(result.logs, 1);

        const log = result.logs[0];
        assert.isNotNull(log);

        const event = log.event;
        assert.equal(event, 'AddSupplierEvent');

        const eventArgs = log.args;
        assert.isNotEmpty(eventArgs.from);
        assert.isNotEmpty(eventArgs.id);
        assert.equal(eventArgs.id, supplier1);
        assert.equal(eventArgs.name, 'Supplier 1');
});
