export const encodePredicates = (predicates: ItemsPredicate[]): string => {
    const types = ["(bytes,address)[]"];
    const values = predicates.map(p => [p.data, p.verifier]);

    const coded = ethers.utils.defaultAbiCoder.encode(types, [values]);
    return ethers.utils.keccak256(coded);
};
