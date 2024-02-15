// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin-upgradeable/token/ERC20/ERC20Upgradeable.sol";

import {LiquidStaking} from "../src/LiquidStaking/LiquidStaking.sol";
import {LiquidStakingManager} from "../src/LiquidStaking/LiquidStakingManager.sol";
import {LiquidStakingMain} from "../src/LiquidStaking/LiquidStakingMain.sol";
import {LiquidStakingMisc} from "../src/LiquidStaking/LiquidStakingMisc.sol";
import {NDistributor} from "../src/NDistributor.sol";
import {NASTR} from "../src/NASTR.sol";
import {NFTDistributor} from "../src/NFTDistributor.sol";
import {AdaptersDistributor} from "../src/AdaptersDistributor.sol";
import {KaglaAdapter} from "../src/KaglaAdapter.sol";
import {AlgemLiquidStakingDiscount} from "../src/AlgemLiquidStakingDiscount.sol";

import {MockDappsStaking} from "../src/mock/MockDappsStaking.sol";

import {MockKaglaPool} from "../src/mock/MockKaglaPool.sol";
import {MockKaglaFarm} from "../src/mock/MockKaglaFarm.sol";
import {MockKaglaMinter} from "../src/mock/MockKaglaMinter.sol";
import {MockERC20} from "../src/mock/MockERC20.sol";

import {IKaglaPool} from "../src/interfaces/IKaglaPool.sol";
import {IKaglaFarm} from "../src/interfaces/IKaglaFarm.sol";
import {IMinter} from "../src/interfaces/IMinter.sol";
import {IAdaptersDistributor} from "../src/interfaces/IAdaptersDistributor.sol";

abstract contract DeployStorage {
    using SafeERC20 for ERC20;

    ProxyAdmin admin;

    MockDappsStaking ds;

    TransparentUpgradeableProxy lsProxy;
    TransparentUpgradeableProxy managerProxy;
    TransparentUpgradeableProxy distrProxy;
    TransparentUpgradeableProxy nastrProxy;
    TransparentUpgradeableProxy nftdistrProxy;
    TransparentUpgradeableProxy adistrProxy;
    TransparentUpgradeableProxy nftProxy;

    LiquidStaking lsImpl;
    LiquidStakingManager managerImpl;
    NDistributor distrImpl;
    NASTR nastrImpl;
    NFTDistributor nftdistrImpl;
    AdaptersDistributor adistrImpl;    
    AlgemLiquidStakingDiscount nftImpl;

    LiquidStaking ls;
    LiquidStakingManager manager;
    NDistributor distr;
    NASTR nastr;
    NFTDistributor nftdistr;
    AdaptersDistributor adistr;
    AlgemLiquidStakingDiscount nft;

    LiquidStakingMain lsMain;
    LiquidStakingMisc lsMisc;

    LiquidStakingMain liquid;
    
    bytes4[] selectorsMain = [
        bytes4(0x59b40f41),bytes4(0xa217fddf),bytes4(0x40bf8a8d),bytes4(0x5f1554e3),bytes4(0x1b2df850),bytes4(0x4421bd1e),bytes4(0x86b3cd26),bytes4(0x59601ebc),bytes4(0xe2e836f8),bytes4(0xe932b37b),bytes4(0x54b057f9),bytes4(0x1f19014b),bytes4(0xd1058e59),bytes4(0x00179fbd),bytes4(0x973628f6),bytes4(0xdcf425df),bytes4(0xda3bc958),bytes4(0x2a14d8f4),bytes4(0x6bbea766),bytes4(0x05e2a217),bytes4(0xc21a7276),bytes4(0xeb51a44c),bytes4(0x1dc00785),bytes4(0xf128f631),bytes4(0x2ea31bf6),bytes4(0xc4e137e7),bytes4(0x248a9ca3),bytes4(0x2f2ff15d),bytes4(0x91d14854),bytes4(0x6f68f2e9),bytes4(0xc8902a21),bytes4(0x0f24ca7d),bytes4(0x8c0f9aac),bytes4(0x6f1e8533),bytes4(0x2e4a4a17),bytes4(0xadc1b956),bytes4(0xe77ee345),bytes4(0x12a12a06),bytes4(0x5495ec81),bytes4(0xd0b06f5d),bytes4(0x5ca5914e),bytes4(0xe09c1954),bytes4(0x1bb5e2dc),bytes4(0xf1887684),bytes4(0xbd1bbd3b),bytes4(0xa5ae02ac),bytes4(0xc3b49d04),bytes4(0x4d617451),bytes4(0xb8d7cac9),bytes4(0x36568abe),bytes4(0xd547741f),bytes4(0x66666aa9),bytes4(0xd78cfe06),bytes4(0xa22eae1b),bytes4(0xfd5e6dd1),bytes4(0x16934fc4),bytes4(0xaf66c36b),bytes4(0x01ffc9a7),bytes4(0xb1357bf9),bytes4(0x12b3b4e6),bytes4(0xad7a672f),bytes4(0xbf2d9e0b),bytes4(0xa44bca8e),bytes4(0xc71367b5),bytes4(0x24f0f548),bytes4(0x6f5e4488),bytes4(0xc78731dc),bytes4(0x386df6eb),bytes4(0xd6356ff4),bytes4(0xab486929),bytes4(0x2e1a7d4d),bytes4(0x24025b19),bytes4(0x422b1077),bytes4(0xa2e62045),bytes4(0x8bf34237),bytes4(0x591ffad9),bytes4(0x14ed1db0)
    ];

    bytes4[] selectorsMisc = [
        bytes4(0x0ceff204),bytes4(0xa0231e29),bytes4(0x27917d60)
    ];

    // Kagla state
    TransparentUpgradeableProxy kaglaAdapterProxy;
    KaglaAdapter kaglaAdapterImpl;
    KaglaAdapter kaglaAdapter;
    MockKaglaPool kaglaPool;
    MockKaglaFarm kaglaFarm;
    MockERC20 kaglaLp;
    MockERC20 kaglaGauge;
    MockERC20 kaglaRewardToken;
    MockKaglaMinter kaglaMinter;
}

