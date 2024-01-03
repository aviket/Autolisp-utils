(setq my-reactor nil)
(defun create-reactor () 
  (setq my-reactor (vlr-command-reactor 
                     "Line Reactor"

                     (list 
                       (cons :vlr-commandended 'printee)
                       (cons :vlr-commandcancelled 'ptintcc)
                       (cons :vlr-commandfailed 'printff)
                     )
                   )
  )
  (vlr-add my-reactor)
)

(defun printee (reactor args) 
  (princ (car args))
  (princ reactor)
  (if (equal (car args) "LINE") 
    (princ "Line command Ended")
  )
  (if (equal (car args) "MOVE") 
    (princ "move command Ended")
  )
)

(defun ptintcc (reactor args) 
  (if (equal (car args) "LINE") 
    (princ "Line command cancelled")
  )
)

(defun printff (reactor args) 
  (if (equal (car args) "LINE") 
    (princ "Line command Failed")
  )
)

;;; function lists all files of given type  in a folder
(defun get-dwg-files (folder ext / files) 
  (setq files (vl-directory-files folder "*." ext  0))
  (setq files (mapcar '(lambda (x) (strcat folder "\\" x)) files))
  files ;
)

;; function opens all files in a folder
(defun openfiles (files) 
  (foreach file files 
    (vla-open (VLA-GET-DOCUMENTS (vlax-get-Acad-Object)) file)
  )
)

;; (setq flax (get-dwg-files "C:\\Users\\Avinash\\Documents\\dwg1\\dwg1"))



