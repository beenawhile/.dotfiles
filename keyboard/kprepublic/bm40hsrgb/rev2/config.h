/* Copyright 2020 tominabox1
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#pragma once

#ifdef RGB_DI_PIN
#    define RGB_MATRIX_KEYPRESSES // reacts to keypresses
#endif
#ifdef RGB_MATRIX_ENABLE
// IS31FL3733 configuration
#    define DRIVER_COUNT 1
#    define DRIVER_ADDR_1 0b1010000
#    define DRIVER_1_LED_TOTAL 47
#    define ISSI_LED_TOTAL DRIVER_1_LED_TOTAL
// Underglow LEDs are WS2812, but someone might want to use RGBLIGHT for them;
// don't use those LEDs in RGB Matrix in that case.
#    ifdef RGBLIGHT_ENABLE
#        define WS2812_LED_TOTAL 0
#    else
#        define WS2812_LED_TOTAL 6
#    endif
#    define DRIVER_LED_TOTAL (ISSI_LED_TOTAL + WS2812_LED_TOTAL)
#    define RGB_MATRIX_LED_COUNT (DRIVER_LED_TOTAL)

#    define RGB_DISABLE_WHEN_USB_SUSPENDED // turn off effects when suspended


// combo length
#   define COMBO_COUNT 4
#   define COMBO_KEY_BUFFER_LENGTH 8
#   define COMBO_BUFFER_LENGTH 4
#endif

/// -- Home Row --
// Configure the global tapping term (default: 200ms)
#define TAPPING_TERM 200
// Prevent normal rollover on alphas from accidentally triggering mods.
// #define IGNORE_MOD_TAP_INTERRUPT
// Enable rapid switch from tap to hold, disables double tap hold auto-repeat.
#define QUICK_TAP_TERM 0
#define TAPPING_TERM_PER_KEY
