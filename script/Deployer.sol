// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "../lib/openzeppelin-contracts/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

import {Script, console2} from "forge-std/Script.sol";
// import {LiquidStaking} from "../src/LiquidStaking/LiquidStaking.sol";
// import {LiquidStakingManager} from "../src/LiquidStaking/LiquidStakingManager.sol";
// import {LiquidStakingMain} from "../src/LiquidStaking/LiquidStakingMain.sol";
// import {LiquidStakingAdmin} from "../src/LiquidStaking/LiquidStakingAdmin.sol";
// import {LiquidStakingMisc} from "../src/LiquidStaking/LiquidStakingMisc.sol";
// import {NDistributor} from "../src/NDistributor.sol";
// import {NASTR} from "../src/NASTR.sol";
// import {NFTDistributor} from "../src/NFTDistributor.sol";
// import {AdaptersDistributor} from "../src/AdaptersDistributor.sol";

contract Deployer is Script {

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        

        vm.stopBroadcast();
    }
}