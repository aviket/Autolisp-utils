(defun acad-version () 
  (atof (substr (getvar "ACADVER") 1 4)))

(defun acad-object () 
  (vlax-get-acad-object))

(defun acad-actdoc () 
  (vla-get-activedocument (acad-object)))

(defun acad-dwgname () 
  (vlax-get (acad-actdoc) 'Name))

(setq *acadobj* (acad-object))
(setq *acaddoc* (acad-actdoc))
