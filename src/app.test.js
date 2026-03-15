const request = require("supertest");

const app = require("./app");

describe("GET /", () => {
    //navigate to root and check the the response is "Hello World!"
    it('responds with "Hello World!"', (done) => { 
        request(app).get('/').expect('Hello World!', done);
    });
});

describe("GET /John", () => {
    //navigate to /John and check the the response is "Hello John!"
    it('responds with "Hello John!"', (done) => { 
        request(app).get('/John').expect('Hello John!', done);
    });
});