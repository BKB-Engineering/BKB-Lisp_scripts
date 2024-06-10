;TODO read firmware and hardware version fron skate and remote
(def firts_iteration_info 0)
(def info_screen_num 0)

(defun info_screen(){
    (if (= firts_iteration_info 0){
        (clear_screen)
        (def text_box (img-buffer 'indexed2 60 14))
        (txt-block-l text_box 1 0 0  font_9x14 "EXIT")
        (disp-render text_box (+ x_offset 0) (+ y_offset 53) '(0 0xFFFFFF))
        (img-clear text_box)
        
        (txt-block-c text_box 1 40 0  font_9x14 "NEXT")
        (disp-render text_box (+ x_offset 70) (+ y_offset 53) '(0 0xFFFFFF))
        (img-clear text_box) 
        
        (txt-block-l text_box 1 0 0  font_9x14 "Fw:")
        (disp-render text_box (+ x_offset 50) (+ y_offset 12) '(0 0xFFFFFF))
        (img-clear text_box)
        
        (txt-block-l text_box 1 0 0  font_9x14 "Hw:")
        (disp-render text_box (+ x_offset 50) (+ y_offset 25) '(0 0xFFFFFF))
        (img-clear text_box)
        
        (txt-block-l text_box 1 0 0  font_9x14 "Lisp:")
        (disp-render text_box (+ x_offset 32) (+ y_offset 38) '(0 0xFFFFFF))
        (img-clear text_box)
        
        (def numb_box (img-buffer 'indexed2 36 14))
        (setq firts_iteration_info 1)
           
    })
    
    (cond
        ((eq info_screen_num 0) (progn
            (txt-block-l text_box 1 0 0  font_9x14 "Remote")
            (disp-render text_box (+ x_offset 1) (+ y_offset -1) '(0 0xFFFFFF))
            (img-clear text_box)
            
            (txt-block-l numb_box 1 0 0  font_9x14 (str-from-n 6.05 "%.2f")) ; firmware version
            (disp-render numb_box (+ x_offset 77) (+ y_offset 12) '(0 0xFFFFFF))
            (img-clear numb_box)
            
            (txt-block-l numb_box 1 0 0  font_9x14 (str-from-n 1.0 "%.2f")) ; hardware version
            (disp-render numb_box (+ x_offset 77) (+ y_offset 25) '(0 0xFFFFFF))
            (img-clear numb_box)
            
            (txt-block-l numb_box 1 0 0  font_9x14 (str-from-n Lisp_V "%.2f")) ; lisp version
            (disp-render numb_box (+ x_offset 77) (+ y_offset 38) '(0 0xFFFFFF))
            (img-clear numb_box)
        
        
        ))
        ((eq info_screen_num 1) (progn
            (txt-block-l text_box 1 0 0  font_9x14 "Receiver")
            (disp-render text_box (+ x_offset 1) (+ y_offset -1) '(0 0xFFFFFF))
            (img-clear text_box)
            
            (txt-block-l numb_box 1 0 0  font_9x14 (str-from-n 6.15 "%.2f")) ; firmware version
            (disp-render numb_box (+ x_offset 77) (+ y_offset 12) '(0 0xFFFFFF))
            (img-clear numb_box)
            
            (txt-block-l numb_box 1 0 0  font_9x14 (str-from-n 1.1 "%.2f")) ; hardware version
            (disp-render numb_box (+ x_offset 77) (+ y_offset 25) '(0 0xFFFFFF))
            (img-clear numb_box)
            
            (txt-block-l numb_box 1 0 0  font_9x14 (str-from-n 1.1 "%.2f")) ; lisp version
            (disp-render numb_box (+ x_offset 77) (+ y_offset 38) '(0 0xFFFFFF))
            (img-clear numb_box)
        
        
        ))
        ((eq info_screen_num 2) (progn
            (txt-block-l text_box 1 0 0  font_9x14 "Skate")
            (disp-render text_box (+ x_offset 1) (+ y_offset -1) '(0 0xFFFFFF))
            (img-clear text_box)
            
            (txt-block-l numb_box 1 0 0  font_9x14 (str-from-n 1.2 "%.2f")) ; hardware version
            (disp-render numb_box (+ x_offset 77) (+ y_offset 12) '(0 0xFFFFFF))
            (img-clear numb_box)
            
            (txt-block-l numb_box 1 0 0  font_9x14 (str-from-n 6.25 "%.2f")) ; firmware version
            (disp-render numb_box (+ x_offset 77) (+ y_offset 25) '(0 0xFFFFFF))
            (img-clear numb_box)
            
            (txt-block-l numb_box 1 0 0  font_9x14 (str-from-n 1.2 "%.2f")) ; lisp version
            (disp-render numb_box (+ x_offset 77) (+ y_offset 38) '(0 0xFFFFFF))
            (img-clear numb_box)

        ))
    )
    
    (if (= cfg_pressed_short 1){
        (setq cfg_pressed_short 0)
        (setq info_screen_num (+ info_screen_num 1))
        (if (> info_screen_num 2)
            (setq info_screen_num 0)
        )
    }) 
    
    (if (= on_pressed_short 1){
        (setq on_pressed_short 0) 
        (clear_screen)
        (setq firts_iteration 0)
        (setq menu_sub_index 0)
        (setq enter_menu 0)
        (setq firts_iteration_info 0)
        (setq info_screen_num 0)       
     })   
})