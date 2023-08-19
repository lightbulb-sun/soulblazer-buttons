!MASK_BUTTON_A    = $0080
!MASK_BUTTON_B    = $8000
!MASK_BUTTON_Y    = $4000
!MASK_REST       #= ($ffff-!MASK_BUTTON_A-!MASK_BUTTON_B-!MASK_BUTTON_Y)
!MASK_SELECT      = $2000

lorom

org $8389
            jmp     my_code

org $ff00
my_code:
            tax
            and.w   #!MASK_REST
            pha
.turn_b_into_y
            txa
            and.w   #!MASK_BUTTON_B
            lsr
            ora     1, s
            sta     1, s
.turn_a_into_b
            txa
            and.w   #!MASK_BUTTON_A
            xba
            ora     1, s
            sta     1, s
.turn_y_into_a
            txa
            and.w   #!MASK_BUTTON_Y
            xba
            asl
            ora     1, s
            sta     1, s
.turn_x_into_second_select
            pla
            pha
            xba
            lsr
            and.w   #!MASK_SELECT
            ora     1, s
            sta     1, s
            pla
            jmp     $8391
