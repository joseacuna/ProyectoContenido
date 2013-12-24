<!DOCTYPE html>
<html>
    <head>
        <title>
            Title
        </title>
        <meta charset='utf-8'>
    </head>
    <body>
        
        <h1> Crear Profesor</h1>
        <br>
        <?= form_open('/planificacion/recibirdatos')?>
    <?php
     $rut = array(
         'name'=> 'rut',
         'placeholder'=>'12.345.678-9'
     );
      $nombre = array(
         'name'=> 'nombre',
         'placeholder'=>'Escribe tu Nombre'
     );
      $apellido1 = array(
         'name'=> 'apellido1',
         'placeholder'=>'Apellido Paterno'
     );
     $apellido2 = array(
         'name'=> 'apellido2',
         'placeholder'=>'Apellido Materno'
     );
      $escuela = array(
         'name'=> 'escuela',
         'placeholder'=>'Numero 1'
     );
    ?>
        <?= form_label('Rut: ','rut')?>
            <?= form_input($rut)?>
        
        <br>
         <?= form_label('Nombre: ','nombre')?>
            <?= form_input($nombre)?>
        
        <br>
        <?= form_label('Apellido Paterno: ','apellido1')?>
            <?=form_input($apellido1)?>
         <br>
        <?=  form_label('Apellido Materno: ','apellido2')?>
            <?=form_input($apellido2)?>
        
        <br>
        <?= form_label('Escuela','escuela')?>
            <?=  form_input($escuela)?>
     
        <br>
        <?=  form_submit('','Enviar')?>
        <?= form_close()?>
        
    </body>
</html>
