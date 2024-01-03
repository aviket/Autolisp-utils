MyMultiLists : dialog {
  key = "Title";
  label = "";
  : boxed_column {
    label = "Select an Item";
    : list_box {
      key = "List1";//Value1$ from lsp file
      height = 6.27;
      fixed_height = true;
      width = 32.92;
      fixed_width = true;
    }
    spacer;
  }
  : boxed_column {
    label = "Multi Select Items";
    : list_box {
      multiple_select = true;
      key = "List2";//Value2$ from lsp file
      height = 6.27;
      fixed_height = true;
      width = 32.92;
      fixed_width = true;
    }
    spacer;
  }
  spacer;
  ok_only;
}//MyMultiLists