import expectThrow from './helpers/expectThrow';
.
.
.
describe('borrowBook', function() {
        it("should not allow borrowing book if value send is less than 100", async function() {
            await lms.addBook('a', 'b', 'c', 'e', 'f', 'g');
            await lms.addMember('Michael Scofield', accounts[2], "Ms@gmail.com");
            await lms.borrowBook(1, {from: accounts[2], value: 10**12})
            await expectThrow(lms.borrowBook(1, {from: accounts[2], value: 10000})); 
        });
});
