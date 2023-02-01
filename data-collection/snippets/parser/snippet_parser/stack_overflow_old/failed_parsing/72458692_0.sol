
const assert = require('assert'); 
const { beforeEach } = require('mocha');


class exampleClass {
    func1() {
        return 'random value 1';
    }
    func2() {
        return 'random_value_2';
    }
}


let exam;


beforeEach(() => {
    exam = new exampleClass(); 
});


describe('name of the describe', () => {
    
    it('This example shows how the assert will pass', () => {
        assert.equal(exam.func1(), 'random value 1'); 
    });
    xit('This example shows how the assert will fail, but the test will be skipped because the "X" symbol is added like a prefix for "it".', () => {
        assert.equal(exam.func1(), 'random value'); 
    });
    it('This example shows how the assert will pass', () => {
        assert.equal(exam.func2(), 'random_value_2'); 
    });
});
