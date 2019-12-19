<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

echo '<select id="ddl" onchange="configureDropDownLists(this,document.getElementById(\'ddl2\'))">';
    echo '<option value=""></option>';
    echo '<option value="Colours">Colours</option>';
    echo '<option value="Shapes">Shapes</option>';
    echo '<option value="Names">Names</option>';
    echo '</select>';
    
    echo '<select id="ddl2">';
    echo '</select>';

    echo '<form action="#" method="post">';
    echo '<select name="Conference">'; // Open your drop down box
// Loop through the query results, outputing the options one by one
    while ($row = pg_fetch_row($rs)) {
        echo '<option value="' . $row[0] . '">' . $row[0] . '</option>';
    }
    echo '</select>'; // Close your drop down box
    echo '<input type="submit" name="submit" value="Get Selected Values" />';
    echo '</form>';
            
    echo '<br><br>';
    
    <script type="text/javascript">
    function configureDropDownLists(ddl1, ddl2) {
      var colours = ['Black', 'White', 'Blue'];
      var shapes = ['Square', 'Circle', 'Triangle'];
      var names = ['John', 'David', 'Sarah'];

      switch (ddl1.value) {
        case 'Colours':
          ddl2.options.length = 0;
          for (i = 0; i < colours.length; i++) {
            createOption(ddl2, colours[i], colours[i]);
          }
          break;
        case 'Shapes':
          ddl2.options.length = 0;
          for (i = 0; i < shapes.length; i++) {
            createOption(ddl2, shapes[i], shapes[i]);
          }
          break;
        case 'Names':
          ddl2.options.length = 0;
          for (i = 0; i < names.length; i++) {
            createOption(ddl2, names[i], names[i]);
          }
          break;
        default:
          ddl2.options.length = 0;
          break;
      }

    }

    function createOption(ddl, text, value) {
      var opt = document.createElement('option');
      opt.value = value;
      opt.text = text;
      ddl.options.add(opt);
    }
    </script>
    
    //Select box with search
        <select id="select-univ">
        <option disabled selected>Select a University</option>
    </select>

    <script type="text/javascript">
        var json = <?php
echo json_encode(Universities::getUniversities());
?>;
        $('#select-univ').select2({data: json});
    </script>
    
            echo '<select id="select-univ2" name="university">'; // Open your drop down box
            echo '<option disabled>Select a University</option>';
            echo '<option selected>' . $univ . '</option>';
        echo '</select>';
        
                <script type="text/javascript">
            var json = <?php
        echo json_encode(Universities::getUniversities());
        ?>;
            $('#select-univ2').select2({data: json, id: function(object) {
                         return object.text;
                      }});
        </script>