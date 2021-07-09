;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12533 (MINGW32)
;--------------------------------------------------------
	.module 00_dialogs_data
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _grandpa_thanks4
	.globl _grandpa_thanks3
	.globl _grandpa_thanks2
	.globl _grandpa_thanks1
	.globl _grandpa_thanks
	.globl _darkness_warn3
	.globl _darkness_warn2
	.globl _darkness_warn1
	.globl _darkness_warn
	.globl _firefly_caught1
	.globl _firefly_caught
	.globl _firefly_out3
	.globl _firefly_out2
	.globl _firefly_out1
	.globl _firefly_out
	.globl _daisy_gives_pie5
	.globl _daisy_gives_pie4
	.globl _daisy_gives_pie3
	.globl _daisy_gives_pie2
	.globl _daisy_gives_pie1
	.globl _daisy_gives_pie
	.globl _daisy_dialog4
	.globl _daisy_dialog3
	.globl _daisy_dialog2
	.globl _daisy_dialog1
	.globl _daisy_dialog
	.globl _coin_found1
	.globl _coin_found
	.globl _intro4
	.globl _intro3
	.globl _intro2
	.globl _intro1
	.globl _intro
	.globl _cleared_path1
	.globl _cleared_path
	.globl _too_much_items1
	.globl _too_much_items
	.globl _start_dialog2
	.globl _start_dialog1
	.globl _start_dialog
	.globl _game_over_dialog1
	.globl _game_over_dialog
	.globl _troll_toll2
	.globl _troll_toll1
	.globl _troll_toll
	.globl _troll_dialog3
	.globl _troll_dialog2
	.globl _troll_dialog1
	.globl _troll_dialog
	.globl _dylan_thanks3
	.globl _dylan_thanks2
	.globl _dylan_thanks1
	.globl _dylan_thanks
	.globl _dylan_dialog5
	.globl _dylan_dialog4
	.globl _dylan_dialog3
	.globl _dylan_dialog2
	.globl _dylan_dialog1
	.globl _dylan_dialog
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
	.area _CODE_1
_dylan_dialog:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_0
	.db #0x20	; 32
	.dw _dylan_dialog1
_dylan_dialog1:
	.db #0x00	; 0
	.db #0x01	; 1
	.dw __str_1
	.db #0x20	; 32
	.dw _dylan_dialog2
_dylan_dialog2:
	.db #0x00	; 0
	.db #0x02	; 2
	.dw __str_2
	.db #0x00	; 0
	.dw _dylan_dialog3
_dylan_dialog3:
	.db #0x01	; 1
	.db #0x03	; 3
	.dw __str_3
	.db #0x20	; 32
	.dw _dylan_dialog4
_dylan_dialog4:
	.db #0x00	; 0
	.db #0x04	; 4
	.dw __str_4
	.db #0x00	; 0
	.dw _dylan_dialog5
_dylan_dialog5:
	.db #0x02	; 2
	.db #0x05	; 5
	.dw __str_5
	.db #0x20	; 32
	.dw #0x0000
_dylan_thanks:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_6
	.db #0x00	; 0
	.dw _dylan_thanks1
_dylan_thanks1:
	.db #0x0a	; 10
	.db #0x01	; 1
	.dw __str_7
	.db #0x20	; 32
	.dw _dylan_thanks2
_dylan_thanks2:
	.db #0x00	; 0
	.db #0x02	; 2
	.dw __str_8
	.db #0x00	; 0
	.dw _dylan_thanks3
_dylan_thanks3:
	.db #0x0a	; 10
	.db #0x03	; 3
	.dw __str_9
	.db #0x20	; 32
	.dw #0x0000
_troll_dialog:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_10
	.db #0x20	; 32
	.dw _troll_dialog1
_troll_dialog1:
	.db #0x00	; 0
	.db #0x01	; 1
	.dw __str_11
	.db #0x20	; 32
	.dw _troll_dialog2
_troll_dialog2:
	.db #0x00	; 0
	.db #0x02	; 2
	.dw __str_12
	.db #0x00	; 0
	.dw _troll_dialog3
_troll_dialog3:
	.db #0x08	; 8
	.db #0x03	; 3
	.dw __str_13
	.db #0x20	; 32
	.dw #0x0000
_troll_toll:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_14
	.db #0x00	; 0
	.dw _troll_toll1
_troll_toll1:
	.db #0x0a	; 10
	.db #0x01	; 1
	.dw __str_15
	.db #0x20	; 32
	.dw _troll_toll2
_troll_toll2:
	.db #0x00	; 0
	.db #0x02	; 2
	.dw __str_16
	.db #0x20	; 32
	.dw #0x0000
_game_over_dialog:
	.db #0x00	; 0
	.db #0x01	; 1
	.dw __str_17
	.db #0x00	; 0
	.dw _game_over_dialog1
_game_over_dialog1:
	.db #0x02	; 2
	.db #0x03	; 3
	.dw __str_18
	.db #0x80	; 128
	.dw #0x0000
_start_dialog:
	.db #0x03	; 3
	.db #0x01	; 1
	.dw __str_19
	.db #0x00	; 0
	.dw _start_dialog1
_start_dialog1:
	.db #0x00	; 0
	.db #0x02	; 2
	.dw __str_20
	.db #0x00	; 0
	.dw _start_dialog2
_start_dialog2:
	.db #0x02	; 2
	.db #0x04	; 4
	.dw __str_18
	.db #0x80	; 128
	.dw #0x0000
_too_much_items:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_21
	.db #0x00	; 0
	.dw _too_much_items1
_too_much_items1:
	.db #0x03	; 3
	.db #0x01	; 1
	.dw __str_22
	.db #0x20	; 32
	.dw #0x0000
_cleared_path:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_23
	.db #0x00	; 0
	.dw _cleared_path1
_cleared_path1:
	.db #0x03	; 3
	.db #0x01	; 1
	.dw __str_24
	.db #0x20	; 32
	.dw #0x0000
_intro:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_25
	.db #0x00	; 0
	.dw _intro1
_intro1:
	.db #0x01	; 1
	.db #0x01	; 1
	.dw __str_26
	.db #0x00	; 0
	.dw _intro2
_intro2:
	.db #0x00	; 0
	.db #0x02	; 2
	.dw __str_27
	.db #0x00	; 0
	.dw _intro3
_intro3:
	.db #0x00	; 0
	.db #0x03	; 3
	.dw __str_28
	.db #0x00	; 0
	.dw _intro4
_intro4:
	.db #0x05	; 5
	.db #0x04	; 4
	.dw __str_29
	.db #0x20	; 32
	.dw #0x0000
_coin_found:
	.db #0x01	; 1
	.db #0x00	; 0
	.dw __str_30
	.db #0x00	; 0
	.dw _coin_found1
_coin_found1:
	.db #0x05	; 5
	.db #0x01	; 1
	.dw __str_31
	.db #0x20	; 32
	.dw #0x0000
_daisy_dialog:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_32
	.db #0x00	; 0
	.dw _daisy_dialog1
_daisy_dialog1:
	.db #0x01	; 1
	.db #0x01	; 1
	.dw __str_33
	.db #0x00	; 0
	.dw _daisy_dialog2
_daisy_dialog2:
	.db #0x01	; 1
	.db #0x02	; 2
	.dw __str_34
	.db #0x20	; 32
	.dw _daisy_dialog3
_daisy_dialog3:
	.db #0x00	; 0
	.db #0x03	; 3
	.dw __str_35
	.db #0x00	; 0
	.dw _daisy_dialog4
_daisy_dialog4:
	.db #0x0a	; 10
	.db #0x04	; 4
	.dw __str_36
	.db #0x20	; 32
	.dw #0x0000
_daisy_gives_pie:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_37
	.db #0x20	; 32
	.dw _daisy_gives_pie1
_daisy_gives_pie1:
	.db #0x00	; 0
	.db #0x02	; 2
	.dw __str_38
	.db #0x00	; 0
	.dw _daisy_gives_pie2
_daisy_gives_pie2:
	.db #0x01	; 1
	.db #0x03	; 3
	.dw __str_39
	.db #0x00	; 0
	.dw _daisy_gives_pie3
_daisy_gives_pie3:
	.db #0x0a	; 10
	.db #0x04	; 4
	.dw __str_7
	.db #0x20	; 32
	.dw _daisy_gives_pie4
_daisy_gives_pie4:
	.db #0x00	; 0
	.db #0x05	; 5
	.dw __str_6
	.db #0x00	; 0
	.dw _daisy_gives_pie5
_daisy_gives_pie5:
	.db #0x08	; 8
	.db #0x06	; 6
	.dw __str_40
	.db #0x20	; 32
	.dw #0x0000
_firefly_out:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_41
	.db #0x00	; 0
	.dw _firefly_out1
_firefly_out1:
	.db #0x00	; 0
	.db #0x01	; 1
	.dw __str_42
	.db #0x00	; 0
	.dw _firefly_out2
_firefly_out2:
	.db #0x01	; 1
	.db #0x02	; 2
	.dw __str_43
	.db #0x00	; 0
	.dw _firefly_out3
_firefly_out3:
	.db #0x05	; 5
	.db #0x03	; 3
	.dw __str_44
	.db #0x20	; 32
	.dw #0x0000
_firefly_caught:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_45
	.db #0x00	; 0
	.dw _firefly_caught1
_firefly_caught1:
	.db #0x03	; 3
	.db #0x01	; 1
	.dw __str_46
	.db #0x20	; 32
	.dw #0x0000
_darkness_warn:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_47
	.db #0x00	; 0
	.dw _darkness_warn1
_darkness_warn1:
	.db #0x00	; 0
	.db #0x01	; 1
	.dw __str_48
	.db #0x00	; 0
	.dw _darkness_warn2
_darkness_warn2:
	.db #0x02	; 2
	.db #0x02	; 2
	.dw __str_49
	.db #0x00	; 0
	.dw _darkness_warn3
_darkness_warn3:
	.db #0x00	; 0
	.db #0x03	; 3
	.dw __str_50
	.db #0x20	; 32
	.dw #0x0000
_grandpa_thanks:
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_6
	.db #0x00	; 0
	.dw _grandpa_thanks1
_grandpa_thanks1:
	.db #0x0a	; 10
	.db #0x01	; 1
	.dw __str_7
	.db #0x00	; 0
	.dw _grandpa_thanks2
_grandpa_thanks2:
	.db #0x00	; 0
	.db #0x03	; 3
	.dw __str_51
	.db #0x00	; 0
	.dw _grandpa_thanks3
_grandpa_thanks3:
	.db #0x01	; 1
	.db #0x04	; 4
	.dw __str_52
	.db #0x00	; 0
	.dw _grandpa_thanks4
_grandpa_thanks4:
	.db #0x03	; 3
	.db #0x05	; 5
	.dw __str_53
	.db #0x20	; 32
	.dw #0x0000
__str_0:
	.ascii "-HELLO, DIZZY!"
	.db 0x00
__str_1:
	.ascii "-HI, DYLAN!"
	.db 0x00
__str_2:
	.ascii "-I'VE LOST MY"
	.db 0x00
__str_3:
	.ascii "ELEVATOR KEY..."
	.db 0x00
__str_4:
	.ascii "-OK, I'LL SEE"
	.db 0x00
__str_5:
	.ascii "WHAT I CAN DO."
	.db 0x00
__str_6:
	.ascii "-THANK YOU,"
	.db 0x00
__str_7:
	.ascii "DIZZY!"
	.db 0x00
__str_8:
	.ascii "-NOT AT ALL,"
	.db 0x00
__str_9:
	.ascii "DYLAN."
	.db 0x00
__str_10:
	.ascii "-EERGH!!"
	.db 0x00
__str_11:
	.ascii "-EXCUSE ME, SIR?"
	.db 0x00
__str_12:
	.ascii "-THRE CO'NS"
	.db 0x00
__str_13:
	.ascii "TO PASS!"
	.db 0x00
__str_14:
	.ascii "-HERE YOU ARE,"
	.db 0x00
__str_15:
	.ascii "SIR..."
	.db 0x00
__str_16:
	.ascii "-..."
	.db 0x00
__str_17:
	.ascii "G A M E  O V E R"
	.db 0x00
__str_18:
	.ascii "PRESS  START"
	.db 0x00
__str_19:
	.ascii "DIZZY  AND"
	.db 0x00
__str_20:
	.ascii "THE MUSHROOM PIE"
	.db 0x00
__str_21:
	.ascii "YOU CAN CARRY"
	.db 0x00
__str_22:
	.ascii "3 ITEMS ONLY!"
	.db 0x00
__str_23:
	.ascii "YOU HAVE CLEARED"
	.db 0x00
__str_24:
	.ascii "THE PATH!"
	.db 0x00
__str_25:
	.ascii "AS YOU ENTER THE"
	.db 0x00
__str_26:
	.ascii "CAVE, YOU HEAR"
	.db 0x00
__str_27:
	.ascii "HOW THE ENTRANCE"
	.db 0x00
__str_28:
	.ascii "COLLAPSES BEHIND"
	.db 0x00
__str_29:
	.ascii "YOU..."
	.db 0x00
__str_30:
	.ascii "YOU HAVE FOUND"
	.db 0x00
__str_31:
	.ascii "A COIN!"
	.db 0x00
__str_32:
	.ascii "-HAVE YOU GOT"
	.db 0x00
__str_33:
	.ascii "MUSHROOMS FOR"
	.db 0x00
__str_34:
	.ascii "THE PIE, DIZZY?"
	.db 0x00
__str_35:
	.ascii "-JUST A MOMENT,"
	.db 0x00
__str_36:
	.ascii "DAISY!"
	.db 0x00
__str_37:
	.ascii "AN HOUR LATER..."
	.db 0x00
__str_38:
	.ascii "-TAKE THIS PIE"
	.db 0x00
__str_39:
	.ascii "TO OUR GRANDPA,"
	.db 0x00
__str_40:
	.ascii "I'LL DO!"
	.db 0x00
__str_41:
	.ascii "YOU DROP THE JAR"
	.db 0x00
__str_42:
	.ascii "IT OPENS,AND THE"
	.db 0x00
__str_43:
	.ascii "FIREFLY BREAKS"
	.db 0x00
__str_44:
	.ascii "FREE..."
	.db 0x00
__str_45:
	.ascii "YOU HAVE  CAUGHT"
	.db 0x00
__str_46:
	.ascii "A FIREFLY!"
	.db 0x00
__str_47:
	.ascii "YOU ENTER A VERY"
	.db 0x00
__str_48:
	.ascii "DARK  ROOM, EVIL"
	.db 0x00
__str_49:
	.ascii "RED EYES ARE"
	.db 0x00
__str_50:
	.ascii "SHINING AHEAD..."
	.db 0x00
__str_51:
	.ascii "CONGRATULATIONS!"
	.db 0x00
__str_52:
	.ascii "YOUR QUEST IS"
	.db 0x00
__str_53:
	.ascii "COMPLETE!"
	.db 0x00
	.area _INITIALIZER
	.area _CABS (ABS)
