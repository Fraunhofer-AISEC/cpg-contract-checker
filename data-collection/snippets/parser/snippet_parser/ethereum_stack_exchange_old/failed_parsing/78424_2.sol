      const validateResult2 = await result.ace.validateProofByHash(
        JOIN_SPLIT_PROOF, result.seller.jsProofHash, result.validator.address,
      )
      assert( Boolean(validateResult2['0']),
        'seller proof hash is not associated with transferer/sender, when sent from Javascript user'
      )
