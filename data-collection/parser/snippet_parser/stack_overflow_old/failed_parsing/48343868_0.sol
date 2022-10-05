 
transferTokens(from, to, amount, type) {
    if (type === 'transfer_to_admin' || type === 'transfer_from_user') {
        return this.contract.methods.transferFrom(from, to, amount).send({ from })
            .catch((err) => {
                logger.info(err);
                return Promise.reject(err);
            });
    }
    if (type === 'transfer_from_admin') {
        return this.contract.methods.transfer(to, amount).send({ 'from': this.coinbase })
            .catch((error) => {
                logger.info(error);
                return Promise.reject(error);
            });
    }
}
