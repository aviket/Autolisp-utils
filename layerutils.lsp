(load "autils_cad.lsp")


(defun get-layer-object-by-name (layername) 
  (setq retlyr nil)
  (vlax-for lyr (vla-get-layers (acad-actdoc)) 
    (if (= (vla-get-name lyr) layername) 
      (setq retlyr lyr)
    )
  )
  retlyr;
)
      
      
(defun get-layer-by-name (layername colindex) 
    (vlax-for lyr (vla-get-layers (vla-get-activedocument(vlax-get-acad-object) ))
      (if (= (vla-get-name lyr) 
                    
                    
    )
)


(defun get-layer-color-by-name (layername) 
  (setq ldata (tblsearch "layer" layername))
   (setq clr nil)
  (if ldata
      (setq clr (cdr (assoc 62 ldata  )))
  )
  clr;
)

(defun put-layer-color-by-name (layername colindex) 
    (setq layobj (get-layer-object-by-name layername))
    (if layobj 
      (vla-put-color layobj colindex)  
    
    )
)