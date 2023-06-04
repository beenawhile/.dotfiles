/*
Copyright 2022 sporewoh

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

#ifndef __ASSEMBLER__
#    include "pin_defs.h"
#endif

/* diode directions */
#define COL2ROW 0
#define ROW2COL 1

/* key matrix size */
#define MATRIX_ROWS 4
#define MATRIX_COLS 10

/* pin-out for PCB */
#define MATRIX_ROW_PINS { F0, F1, F4, F5 }
#define MATRIX_COL_PINS { B5, B4, D7, D6, D4, D5, D3, D2, D1, D0 }


/* COL2ROW or ROW2COL */
#define DIODE_DIRECTION COL2ROW

#define DYNAMIC_KEYMAP_LAYER_COUNT 10

/// -- Home Row --
// Configure the global tapping term (default: 200ms)
#define TAPPING_TERM 220
// Enable rapid switch from tap to hold, disables double tap hold auto-repeat.
#define QUICK_TAP_TERM 0
// -- Enable different tapping term per key
#define TAPPING_TERM_PER_KEY

#define BOTH_SHIFTS_TURNS_ON_CAPS_WORD
#define CAPS_WORD_INVERT_ON_SHIFT
