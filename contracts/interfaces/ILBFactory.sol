// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import "./ILBPair.sol";
import "./ILBFactoryHelper.sol";

interface ILBFactory {
    function MAX_BASIS_POINT() external pure returns (uint256);

    function MIN_FEE() external pure returns (uint256);

    function MAX_FEE() external pure returns (uint256);

    function MIN_BIN_STEP() external pure returns (uint256);

    function MAX_BIN_STEP() external pure returns (uint256);

    function MIN_PROTOCOL_SHARE() external pure returns (uint256);

    function MAX_PROTOCOL_SHARE() external pure returns (uint256);

    function factoryHelper() external view returns (ILBFactoryHelper);

    function feeRecipient() external view returns (address);

    function unlocked() external view returns (bool);

    function allLBPairs(uint256 id) external returns (ILBPair);

    function allPairsLength() external view returns (uint256);

    function getLBPair(IERC20 tokenA, IERC20 tokenB)
        external
        view
        returns (ILBPair);

    function createLBPair(
        IERC20 token0,
        IERC20 token1,
        uint168 maxAccumulator,
        uint16 filterPeriod,
        uint16 decayPeriod,
        uint16 binStep,
        uint16 baseFactor,
        uint16 protocolShare
    ) external returns (ILBPair pair);

    function setFeeRecipient(address feeRecipient) external;

    function setFeeParametersOnPair(
        IERC20 token0,
        IERC20 token1,
        uint168 maxAccumulator,
        uint16 filterPeriod,
        uint16 decayPeriod,
        uint16 baseFactor,
        uint16 protocolShare,
        uint8 variableFeesDisabled
    ) external;
}
