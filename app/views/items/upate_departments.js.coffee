# app/views/items/update_departments.js.coffee
  
$("#departments_select").empty()
  .append("<%= escape_javascript(render(:partial => @departments)) %>")
