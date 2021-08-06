const ERC20 = artifacts.require("ERC20");
const ERC20Burnable = artifacts.require("ERC20Burnable");
const ERC20Capped = artifacts.require("ERC20Capped");
const ERC20Pausable = artifacts.require("ERC20Pausable");

module.exports = function (deployer) {
    deployer.deploy(ERC20, "TecHouse", "TECH", 18, 1000);
    deployer.deploy(ERC20Burnable, "TecHouse", "TECH", 18, 1000);
    deployer.deploy(ERC20Capped, "TecHouse", "TECH", 18, 1000, 1000);
    deployer.deploy(ERC20Pausable, "TecHouse", "TECH", 18, 1000);
};
