var Migrations = artifacts.require("./migrate.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};