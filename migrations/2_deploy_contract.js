const Migrations = artifacts.require("Migrations");
const ShippingContract = artifacts.require("ShippingContract");

module.exports = function (deployer){
    deployer.deploy(Migrations);
    deployer.deploy(ShippingContract);
}