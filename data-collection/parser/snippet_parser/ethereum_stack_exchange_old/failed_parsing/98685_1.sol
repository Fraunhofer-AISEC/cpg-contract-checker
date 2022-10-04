    sqrtPriceX96 = sqrt(price) * 2 ** 96
    # divide both sides by 2 ** 96
    sqrtPriceX96 / (2 ** 96) = sqrt(price)
    # square both sides
    (sqrtPriceX96 / (2 ** 96)) ** 2 = price
    # expand the squared fraction
    (sqrtPriceX96 ** 2) / ((2 ** 96) ** 2)  = price
    # multiply the exponents in the denominator to get the final expression
    sqrtRatioX96 ** 2 / 2 ** 192 = price
