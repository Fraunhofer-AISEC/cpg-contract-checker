Contract.prototype.deploy = function(options, callback){

    options = options || {};

    options.arguments = options.arguments || [];
    options = this._getOrSetDefaultOptions(options);


    
    if(!options.data) {
        if (typeof callback === 'function'){
            return callback(errors.ContractMissingDeployDataError());
        }
        throw errors.ContractMissingDeployDataError();
    }

    var constructor = this.options.jsonInterface.find((method) => {
        return (method.type === 'constructor');
    }) || {};
    constructor.signature = 'constructor';

    return this._createTxObject.apply({
        method: constructor,
        parent: this,
        deployData: options.data,
        _ethAccounts: this.constructor._ethAccounts
    }, options.arguments);
};
