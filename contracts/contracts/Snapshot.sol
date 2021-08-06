// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/**
 * ERC20Snapshot Token Implementation
 *
 * @author Mubashir Rasool Razvi <rizimore@outlook.com>
 */

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";

contract Permit is ERC20Snapshot {
    constructor() ERC20Snapshot("CyberToken", "CT") {
    }
}
