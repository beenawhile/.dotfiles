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
  _RAISE,
  _NUMPAD,
  _ADJUST
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [_QWERTY] = LAYOUT_ortho_4x12(
        KC_ESC,       KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,            KC_Y,            KC_U,    KC_I,    KC_O,    KC_P,             KC_BSPC,
        KC_TAB,       KC_A,    KC_S,    KC_D,    KC_F,    KC_G,            KC_H,            KC_J,    KC_K,    KC_L,    KC_SCLN,          KC_ENT,
        KC_LSFT,      KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,            KC_N,            KC_M,    KC_COMM, KC_DOT,  KC_SLSH,          KC_RSFT,
        LCTL(KC_SPC), KC_LCTL, KC_LALT, KC_LGUI, MO(1),   KC_SPC,  KC_ENT,  MO(2),   KC_RCTL, TG(_NUMPAD), KC_DOWN,          KC_RGHT
    ),
    [_LOWER] = LAYOUT_ortho_4x12(
        KC_TILD, KC_1,     KC_2,      KC_3,     KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_BSPC,
        _______, KC_COLN,  KC_MINS,   KC_EQL,   KC_DQUO, KC_QUOT, KC_GRV,  KC_LPRN, KC_RPRN, KC_LCBR, KC_RCBR, KC_BSLS,
        _______, KC_PERC,  KC_UNDS,   KC_PLUS,  KC_PIPE, KC_QUES, KC_PERC, KC_LBRC, KC_RBRC, KC_LT,   KC_GT,   _______,
        _______, _______,  _______,   _______,  _______, _______, _______, _______, KC_MNXT, KC_VOLD, KC_VOLU, KC_MPLY
    ),
    [_RAISE] = LAYOUT_ortho_4x12(
        KC_GRV, KC_EXLM, KC_AT,   KC_HASH, KC_DLR,  KC_PERC, KC_CIRC, KC_AMPR,    KC_ASTR,    KC_LPRN, KC_RPRN, KC_BSPC, KC_DEL,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_LEFT, KC_DOWN,    KC_UP,      KC_RGHT, KC_RCBR, KC_PIPE,
        _______, KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  KC_NUHS, KC_NUBS, KC_PGUP, KC_PGDN, _______,
        _______, _______, _______, _______, _______, _______, _______, _______, KC_MNXT, KC_VOLD, KC_VOLU, KC_MPLY
    ),
    [_NUMPAD] = LAYOUT_ortho_4x12(
        TG(_NUMPAD), KC_1,     KC_2,     KC_3,    KC_4,    KC_5,    KC_6,    KC_7,       KC_8,       KC_9,    KC_0,    KC_BSPC,
        _______,     KC_F1,    KC_F2,    KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,      KC_F8,      KC_F9,   KC_F10,  KC_ENT,
        _______,     KC_F11,   KC_F12,   _______,   _______,  _______,  _______, KC_NUHS,    KC_NUBS,    KC_PGUP, KC_PGDN, _______,
        _______, _______, _______, _______, _______, _______, _______, _______,  KC_MNXT, TG(_NUMPAD),    KC_VOLU, KC_MPLY
    ),
    [_ADJUST] = LAYOUT_ortho_4x12(
        QK_BOOT, RGB_TOG, RGB_HUI, RGB_SAI, RGB_VAI, _______, _______, _______, _______, _______, _______, DB_TOGG,
        _______, RGB_MOD, RGB_HUD, RGB_SAD, RGB_VAD, AG_NORM, KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, _______, _______,
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______
    )
};

layer_state_t layer_state_set_user(layer_state_t state) {
  return update_tri_layer_state(state, _LOWER, _RAISE, _ADJUST);
}