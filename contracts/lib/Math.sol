pragma solidity ^0.8.19;

library Math {
    /**
     * @dev Returns the largest of two numbers.
     */
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    /**
     * @dev Returns the smallest of two numbers.
     */
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    /**
     * @dev Returns the average of two numbers. The result is rounded towards
     * zero.
     */
    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + (((a % 2) + (b % 2)) / 2);
    }

    /// @dev alias for regular ops because checked ops are now native
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /// @notice floor division, gives 0 instead of error
    /// @dev unchecked for gas savings
    function fdiv(uint256 a, uint256 b) internal pure returns (uint256) {
        if ((b > a) || (b == 0)) {
            return 0;
        } else {
            unchecked {
                return a / b;
            }
        }
    }

    /// @notice floor subtraction gives 0 instead of error, sometimes handy and physically relevant
    /// @dev unchecked for gas savings
    function fsub(uint256 a, uint256 b) internal pure returns (uint256) {
        if (b > a) {
            return 0;
        } else {
            unchecked {
                return a - b;
            }
        }
    }
}
