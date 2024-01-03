; Various Maths and geometry related Utilities

; ## (points-coliniar)
; Test if three points are colineir or not
; * three 3dpoints
; * returns Boolean

(defun is-colinear (p1 p2 p3) 
  (setq d-p1-p2 (distance p1 p2))
  (princ d-p1-p2)
  (setq d-p2-p3 (distance p2 p3))
  (princ d-p2-p3)
  (setq d-p1-p3 (distance p1 p3))
  (princ d-p1-p3)
  (setq retval "")
  (if (< (abs (- (+ d-p1-p2 d-p2-p3) d-p1-p3)) 0.001) 
    (setq retval "p2")
    (if (< (abs (- (+ d-p1-p2 d-p1-p3) d-p2-P3)) 0.001) 
      (setq retval "p1")
      (if (< (abs (- (+ d-p1-p3 d-p2-p3) d-p1-P2)) 0.001) 
        (setq retval "p3")
      )
    )
  )
  retval ;
) 


; ## (vertices-coniside)
; Test in a given list of vertices , if distance between any two consecutive vertices is lesser then a given threshold.
; * 1. a list of 3dpoints
;   2. threshold distance
; * returns a list of dotted pairs ( vertice index . distance)

(defun vertices-coinside (ptlist dst) 
  (setq retlist '(nil))
  (setq ln (length ptlist))
  (setq cnt 0)
  (while (< cnt (1- ln)) 
    (setq dst1 (distance (nth cnt ptlist) (nth (1+ cnt) ptlist)))
    (if (< dst1 dst) 
      (setq retlist (append retlist (list (cons cnt dst1))))
    )
    (setq cnt (1+ cnt))
  )
  retlist ;
)


; ## (vertices-far-apart)
; Test in a given list of vertices , if distance between any two consecutive vertices is more  then a given threshold.
; * 1. a list of 3dpoints
;   2. threshold distance
; * returns a list of dotted pairs ( vertice index . distance)

(defun vertices-far-apart (ptlist dst) 
  (setq retlist '(nil))
  (setq ln (length ptlist))
  (setq cnt 0)
  (while (< cnt (1- ln)) 
    (setq dst1 (distance (nth cnt ptlist) (nth (1+ cnt) ptlist)))
    (if (> dst1 dst) 
      (setq retlist (append retlist (list (cons cnt dst1))))
    )
    (setq cnt (1+ cnt))
  )
  retlist ;
)

;; Intersections  -  Lee Mac
;; Returns a list of all points of intersection between two objects
;; for the given intersection mode.
;; ob1,ob2 - [vla] VLA-Objects
;;     mod - [int] acextendoption enum of intersectwith method

(defun LM:intersections (ob1 ob2 mod / lst rtn) 
  (if 
    (and (vlax-method-applicable-p ob1 'intersectwith) 
         (vlax-method-applicable-p ob2 'intersectwith)
         (setq lst (vlax-invoke ob1 'intersectwith ob2 mod))
    )
    (repeat (/ (length lst) 3) 
      (setq rtn (cons (list (car lst) (cadr lst) (caddr lst)) rtn)
            lst (cdddr lst)
      )
    )
  )
  (reverse rtn)
)

;; find intersections 
(defun c:inter ( / obj1 obj2 )    
    (if (and (setq obj1 (car (entsel "\nSelect 1st Object: ")))
             (setq obj2 (car (entsel "\nSelect 2nd Object: ")))
        )
        (foreach pnt (LM:intersections (vlax-ename->vla-object obj1) (vlax-ename->vla-object obj2) acextendnone)
            (entmake (list '(0 . "POINT") (cons 10 pnt)))
        )
    )
    (princ)
)
(vl-load-com) (princ)






  ; ## (points-polygon)
  ; Test if a set of 3d points form a closed polygon
  ; * a list of 3dpoints
  ; * returns Boolean