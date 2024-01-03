	
;----------------------------------------------------------------------------------------------------------
; c:MyMultiLists - Dialog for list_boxes with single and multi select examples
; Syntax: MyMultiLists
;----------------------------------------------------------------------------------------------------------
(defun c:MyMultiLists (/ Dcl_Id% List1@ List2@ Return# Value1$ Value2$)
  (princ "\nMyMultiLists")(princ)
  ; Set Default Variables
  (if (not *MyMultiLists@);Unique global variable name to store dialog info
    (setq *MyMultiLists@ (list nil "" ""))
  );if
  (setq Value1$ (nth 1 *MyMultiLists@)
        Value2$ (nth 2 *MyMultiLists@)
        List1@ (list "Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday")
        List2@ (list "January" "February" "March" "April" "May" "June" "July" "August"
                     "September" "October" "November" "December")
  );setq
  ; Load Dialog
  (setq Dcl_Id% (load_dialog "C:\\Users\\Avinash\\Documents\\Autolisp-utils\\my-dialog.dcl"))
  (new_dialog "MyMultiLists" Dcl_Id%)
  ; Set Dialog Initial Settings
  (set_tile "Title" " My Multi Lists")
  ; (set_tile "List1" List1@ );*Included
  ; (set_tile "List2" List2@ );*Included
  ; Dialog Actions
  (start_list "List1")
  (mapcar 'add_list List1@)
  (end_list)
  
  (start_list "List2")
  (mapcar 'add_list List2@)
  (end_list)
  
  ; (action_tile "List1" "(set_list_value \"List1@\" \"Value1$\")");*Included
  ; (action_tile "List2" "(set_multilist_value \"List2@\" \"Value2$\")");*Included
  
  
  (setq Return# (start_dialog))
  ; Unload Dialog
  (unload_dialog Dcl_Id%)
  ; (setq *MyMultiLists@ (list nil Value1$ Value2$))
  (princ)
);defun c:MyMultiLists