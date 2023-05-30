/* Copyright 2022 Dennis Kruyt (dennis@kruyt.org)
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

#include QMK_KEYBOARD_H

enum layer_names {
  _QWERTY,
  _LOWER,
  _NAV,
  _ADJUST,
  _NUMPAD,
  _FUNC,
  _MEDIA,
  _MOUSE,
};

enum combos {
    DOTCOMMA_SCLN,
    MCOMM_ESC,
    JK_TAB
};

const uint16_t PROGMEM comm_dot_combo[] = {KC_COMM, KC_DOT, COMBO_END};
const uint16_t PROGMEM m_comm_combo[] = {KC_M, KC_COMM, COMBO_END};
const uint16_t PROGMEM jk_combo[] = {KC_J, KC_K, COMBO_END};

combo_t key_combos[] = {
    [DOTCOMMA_SCLN] = COMBO(comm_dot_combo, KC_SCLN),
    [MCOMM_ESC] = COMBO(m_comm_combo, KC_ESC),
    [JK_TAB] = COMBO(jk_combo, KC_TAB)
};


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [_QWERTY] = LAYOUT_ortho_4x12(
        _______, KC_Q,         KC_W,    KC_E,    KC_R,        KC_T,        KC_Y,           KC_U,        KC_I,    KC_O,    KC_P,    _______,
        _______, KC_A,         KC_S,    SFT_T(KC_D),    KC_F, CTL_T(KC_G), CTL_T(KC_H),    KC_J, KC_K,    KC_L,    KC_BSPC, KC_ENT,
        _______, KC_Z,         KC_X,    KC_C,    KC_V,        KC_B,        KC_N,           KC_M,        KC_COMM, KC_DOT,  KC_SLSH, _______,
        _______, LCTL(KC_SPC), KC_LALT, KC_LGUI, MO(_LOWER),  KC_SPC,      LSFT_T(KC_ENT), MO(_NAV),    KC_RCTL, KC_RALT, _______, _______ 
    ),
    [_LOWER] = LAYOUT_ortho_4x12(
        _______, KC_1,     KC_2,      KC_3,     KC_4,    KC_5,    KC_6,    KC_7,               KC_8,    KC_9,    KC_0,     _______,
        _______, KC_COLN,  KC_MINS,   KC_EQL,   KC_DQUO, KC_QUOT, KC_GRV,  KC_LPRN,            KC_RPRN, KC_LCBR, KC_RCBR,  _______,
        _______, KC_TILD,  KC_UNDS,   KC_PLUS,  KC_PIPE, KC_BSLS, _______, KC_LBRC,            KC_RBRC, KC_LT,   KC_GT,    _______,
        _______, _______,  _______,   _______,  _______, _______, _______, LT(_ADJUST,KC_BSPC), _______, _______, _______, _______ 
    ),
    [_NAV] = LAYOUT_ortho_4x12(
        _______, KC_EXLM, KC_AT,   KC_HASH, KC_DLR,              KC_PERC, KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, _______,
        _______, _______, _______, _______, _______,             _______, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_RCBR, _______,
        _______, _______, _______, _______, _______,             _______, KC_HOME, KC_PGDN, KC_PGUP, KC_END,  _______, _______,
        _______, _______, _______, _______, LT(_ADJUST,KC_TAB),  _______, _______, _______, _______, _______, _______, _______ 
    ),
    [_ADJUST] = LAYOUT_ortho_4x12(
        _______, QK_BOOT, _______, RGB_SAI, _______, RGB_TOG, _______, KC_WH_D, _______, _______, KC_MPRV, _______,
        _______, _______, RGB_SPI, KC_WH_U, RGB_MOD, _______, KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, _______, _______,
        _______, _______, _______, RGB_HUI, KC_MUTE, RGB_VAI, KC_MNXT, KC_MUTE, _______, _______, _______, _______,
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______ 
    ),
    [_NUMPAD] = LAYOUT_ortho_4x12(
        _______, KC_LBRC, KC_7,    KC_8,    KC_9,  KC_RBRC, _______, _______, _______, _______, _______, _______,
        _______, KC_SCLN, KC_4,    KC_5,    KC_6,  KC_EQL,  _______, _______, _______, _______, _______, _______,
        _______, KC_GRV,  KC_1,    KC_2,    KC_3,  KC_BSLS, _______, _______, _______, _______, _______, _______,
        _______, _______, _______, KC_DOT,  KC_0,  KC_UNDS, _______, _______, _______, _______, _______, _______ 
    ),
    [_FUNC] = LAYOUT_ortho_4x12(
        _______, KC_F12,  KC_F7,   KC_F8,   KC_F9,   KC_PSCR, _______, _______, _______, _______, _______, _______,
        _______, KC_F11,  KC_F4,   KC_F5,   KC_F6,   KC_SCRL, _______, _______, _______, _______, _______, _______,
        _______, KC_F10,  KC_F1,   KC_F2,   KC_F3,   KC_PAUS, _______, _______, _______, _______, _______, _______,
        _______, _______, _______, _______, KC_SPC,  KC_TAB,  _______, _______, _______, _______, _______, _______ 
    ),
    [_MEDIA] = LAYOUT_ortho_4x12(
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
        _______, _______, KC_LALT, KC_LGUI, KC_LSFT, KC_LCTL, KC_MPRV, KC_VOLD, KC_VOLU, KC_MNXT, _______, _______,
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
        _______, _______, _______, _______, _______, _______, KC_MSTP, KC_MPLY, KC_MUTE, _______, _______, _______ 
    ),
    [_MOUSE] = LAYOUT_ortho_4x12(
        _______, _______, _______, _______, _______, _______, KC_ACL0, KC_ACL1, KC_ACL2, _______, _______, _______,
        _______, _______, _______, _______, _______, _______, KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, _______, _______,
        _______, _______, _______, _______, _______, _______, KC_WH_R, KC_WH_U, KC_WH_D, KC_WH_L, _______, _______,
        _______, _______, _______, _______, _______, _______, KC_BTN2, KC_BTN1, KC_BTN3, _______, _______, _______ 
    )
};

