var Certification = artifacts.require("./test.sol");

module.exports = function(deployer) {
  deployer.deploy(Certification);
};