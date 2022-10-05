    private void createContract() {
        int createdContractSize = getLength(program.getResult().getHReturn());
        long returnDataGasValue = GasCost.multiply(GasCost.CREATE_DATA, createdContractSize);
        if (mEndGas < returnDataGasValue) {
            program.setRuntimeFailure(
                    Program.ExceptionHelper.notEnoughSpendingGas(
                            program,
                            "No gas to return just created contract",
                            returnDataGasValue));
            result = program.getResult();
            result.setHReturn(EMPTY_BYTE_ARRAY);
        } else if (createdContractSize > Constants.getMaxContractSize()) {
            program.setRuntimeFailure(
                    Program.ExceptionHelper.tooLargeContractSize(
                            program,
                            Constants.getMaxContractSize(),
                            createdContractSize));
            result = program.getResult();
            result.setHReturn(EMPTY_BYTE_ARRAY);
        } else {
            mEndGas = GasCost.subtract(mEndGas,  returnDataGasValue);
            program.spendGas(returnDataGasValue, "CONTRACT DATA COST");
            cacheTrack.saveCode(tx.getContractAddress(), result.getHReturn());
        }
    }
