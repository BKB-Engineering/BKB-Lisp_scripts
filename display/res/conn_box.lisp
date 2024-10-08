@const-start
(defun write_online (online px py){

    (def conn_box (img-buffer 'indexed4 30 14))
    (if (= online 1)
        (progn
        (img-rectangle conn_box 0 0 29 14 2 '(filled) '(rounded 2))
        (img-arc conn_box 13 7 6 90 270 0 '(filled))
        (img-line conn_box 13 2 13 12 0)
        ;(img-line conn_box 9 4 13 4 0)
        ;(img-line conn_box 9 9 13 9 0)
        (img-line conn_box 0 6 9 6 0)
        (img-line conn_box 0 7 9 7 0)
        (img-arc conn_box 16 7 6 270 90 0 '(filled))
        (img-line conn_box 16 1 16 12 0)
        (img-line conn_box 22 6 29 6 0)
        (img-line conn_box 22 7 29 7 0)
        )
        (progn
        (img-rectangle conn_box 0 0 29 14 1 '(filled) '(rounded 2))
        (img-arc conn_box 9 7 6 90 270 0 '(filled))
        (img-line conn_box 9 2 9 12 0)
        (img-line conn_box 9 4 13 4 0)
        (img-line conn_box 9 9 13 9 0)
        (img-line conn_box 0 6 5 6 0)
        (img-line conn_box 0 7 5 7 0)
        (img-arc conn_box 18 7 6 270 90 0 '(filled))
        (img-line conn_box 17 1 17 12 0)
        (img-line conn_box 24 6 29 6 0)
        (img-line conn_box 24 7 29 7 0)
        )
    )
    (disp-render conn_box px py '(0 0xFF9000 0xC0FF00 0x0000FF))

})
@const-end