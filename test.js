const chai = require('chai');
const chaiHttp = require('chai-http');
const server = require('./index.js');
const expect = chai.expect;

chai.use(chaiHttp);

describe('Server', () => {
  it('should return Hello World on / GET', done => {
    chai
      .request(server)
      .get('/')
      .end((err, res) => {
        expect(res).to.have.status(200);
        expect(res.text).to.equal('Hello World');
        done();
      });
  });
});