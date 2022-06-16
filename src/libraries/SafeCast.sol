// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

error SafeCast__Exceeds168Bits(uint256 x);
error SafeCast__Exceeds128Bits(uint256 x);
error SafeCast__Exceeds112Bits(uint256 x);
error SafeCast__Exceeds24Bits(uint256 x);

library SafeCast {
    /// @notice Returns x on uint168 and check that it does not overflow
    /// @param x The value as an uint256
    /// @return The value as an uint168
    function safe168(uint256 x) internal pure returns (uint168) {
        if (x >= 2**168) revert SafeCast__Exceeds168Bits(x);
        return uint168(x);
    }

    /// @notice Returns x on uint128 and check that it does not overflow
    /// @param x The value as an uint256
    /// @return The value as an uint128
    function safe128(uint256 x) internal pure returns (uint128) {
        if (x >= 2**128) revert SafeCast__Exceeds128Bits(x);
        return uint128(x);
    }

    /// @notice Returns x on uint112 and check that it does not overflow
    /// @param x The value as an uint256
    /// @return The value as an uint112
    function safe112(uint256 x) internal pure returns (uint112) {
        if (x >= 2**112) revert SafeCast__Exceeds112Bits(x);
        return uint112(x);
    }

    /// @notice Returns x on uint24 and check that it does not overflow
    /// @param x The value as an uint256
    /// @return The value as an uint24
    function safe24(uint256 x) internal pure returns (uint24) {
        if (x >= 2**24) revert SafeCast__Exceeds24Bits(x);
        return uint24(x);
    }
}