;; 'Absolute' pattern (p.37)
; 
; <div class="positioned">
;   <span class="absolute">Sized Absolute</span>
; </div>
;
; *.positioned { position:relative; }
; *.absolute { position:absolute; top:10px; left:10px; } 

(load "lib/html.lsp")
(load "lib/misc.lsp")

;; args: '((top "10px") (left "10px") [(width "100px") (height "50px") (text_inner "Inner") (text_outer "Outer")])
(define (absolute)

    (set 'top (eval (lookup 'top (args 0))))
    (set 'left (eval (lookup 'left (args 0))))
    (set 'width (eval (lookup 'width (args 0))))
    (if (nil? width) (set 'width "") (set 'width (append "width:" width)))    
    (set 'height (eval (lookup 'height (args 0))))
    (if (nil? height) (set 'height "") (set 'height (append "height:" height)))    
    (set 'text_inner (eval (lookup 'text_inner (args 0))))
    (when (nil? text_inner) (set 'text_inner ""))    
    (set 'text_outer (eval (lookup 'text_outer (args 0))))
    (when (nil? text_outer) (set 'text_outer ""))    

    (set 'class_positioned (string (gen-classname)))
    (set 'class_absolute (string (gen-classname))

    (extend __html (Html:div '((class class_positioned)) 
                        (string text_outer 
                        (Html:span '((class class_absolute)) 
                            text_inner))))
    (extend __css ( string "*." class_positioned " { position:relative; overflow:hidden; } " 
                           "*." class_absolute " { position:absolute; top:" top "; left:" left "; " width "; " height "; }" )))
   


