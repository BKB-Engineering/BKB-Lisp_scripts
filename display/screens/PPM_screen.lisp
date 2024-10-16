;TODO read firmware and hardware version fron skate and remote
(def firts_iteration_ppm 0)
(def ppm_status 0)

@const-start
(defun PPM_screen(){
    (if (= firts_iteration_PPM 0){
        (disp-clear)
        (def text_box (img-buffer 'indexed2 127 14))
        (txt-block-l text_box 1 0 0  font_9x14 "PPM MODE")
        (disp-render text_box (+ x_offset 1) (+ y_offset 0) '(0 0xFFFFFF))
        (img-clear text_box)
        (txt-block-l text_box 1 0 0  font_9x14 "Hold SAVE 2sec")
        (disp-render text_box (+ x_offset 1) (+ y_offset 35) '(0 0xFFFFFF))
        (img-clear text_box)
        (def text_box (img-buffer 'indexed2 36 14))
        (txt-block-l text_box 1 0 0  font_9x14 "EXIT")
        (disp-render text_box (+ x_offset 1) (+ y_offset 49) '(0 0xFFFFFF))
        (img-clear text_box)
        (txt-block-l text_box 1 0 0  font_9x14 "SAVE")
        (disp-render text_box (+ x_offset 90) (+ y_offset 49) '(0 0xFFFFFF))
        (img-clear text_box)
        (if(= (eeprom-read-i ppm_status_add) 0){
            (def text_box (img-buffer 'indexed2 127 14))
            (txt-block-c text_box 1 64 0  font_9x14  "DISABLE")
            (disp-render text_box (+ x_offset 0) (+ y_offset 18) '(0 0xFFFFFF))
            (img-clear text_box)
        }
        {
            (def text_box (img-buffer 'indexed2 127 14))
            (txt-block-c text_box 1 64 0  font_9x14  "ENABLE")
            (disp-render text_box (+ x_offset 0) (+ y_offset 18) '(0 0xFFFFFF))
            (img-clear text_box)
        })
        (setq firts_iteration_ppm 1)

    })
    (if  (> (get-adc-raw) 3500){
        ;(sleep 0.1)
        (txt-block-c text_box 1 64 0  font_9x14  "ENABLE")
        (disp-render text_box (+ x_offset 0) (+ y_offset 18) '(0 0xFFFFFF))
        (img-clear text_box)
        (setq ppm_status 1)

    })
    (if (< (get-adc-raw) 500){
        ;(sleep 0.1)
        (txt-block-c text_box 1 64 0  font_9x14  "DISABLE")
        (disp-render text_box (+ x_offset 0) (+ y_offset 18) '(0 0xFFFFFF))
        (img-clear text_box)
        (setq ppm_status 0)  
    })

    (if (= cfg_pressed_long 1){
       (setq cfg_pressed_long 0)
       (setq cfg_pressed_short 0)
       (eeprom-store-i ppm_status_add ppm_status)
       (setq ppm_status (to-i (eeprom-read-i ppm_status_add)))
       (disp-clear)
       (setq firts_iteration 0)
       (setq menu_sub_index 0)
       (setq enter_menu 0)
       (setq firts_iteration_ppm 0)
    })
 
    (if (= on_pressed_short 1){
        (setq on_pressed_short 0)
        (disp-clear)
        (setq firts_iteration 0)
        (setq menu_sub_index 0)
        (setq enter_menu 0)
        (setq firts_iteration_ppm 0)
     })
})
@const-end