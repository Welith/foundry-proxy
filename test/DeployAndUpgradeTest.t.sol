// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";

contract DeployAndUpgradeTest is Test {
    DeployBox deployBox;
    UpgradeBox upgradeBox;

    address public OWNER = makeAddr("tes");

    BoxV1 public boxV1;

    function setUp() public {
        deployBox = new DeployBox();
        upgradeBox = new UpgradeBox(); 
        boxV1 = BoxV1(deployBox.run());
    }

    function testUpgrades() public {
        BoxV2 newBox = new BoxV2();

        address proxy = upgradeBox.upgradeBox(address(boxV1), address(newBox));

        uint256 expectedValue = 2;
        assertEq(expectedValue, BoxV1(proxy).version());

        uint256 newValue = 42;
        BoxV2(proxy).setNumber(newValue);
        assertEq(newValue, BoxV1(proxy).getNumber());
    }
}