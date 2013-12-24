<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Planificacion Clase Semestral</title>
    <h1>Planificacion Clase Semestral</h1>
<!--<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script language="javascript" type="text/javascript"></script>

    <SCRIPT src="CodeIgniter/generadorCampos.js"></SCRIPT>-->
    </head>
    <body>
        <?= form_open('planificacion/<nombre De Ctrolador>')?>

<?php
$atributos = array(
	'name'=>'form',
	'id'=>'form',
	);
$unidad= array(
	'name'=> 'unidad',
	'id'=> 'unidad',
	'placeholder' =>'Unidad',
	);
$semana = array(
	'name'=> 'semana',
	'id'=> 'semana',
	'placeholder' =>'Semana',
	);
$obj_esp = array(
	'name'=> 'objetivos',
	'id'=> 'objetivos',
	'placeholder' =>'Objetivos',
	);
$contTematico= array(
	'name'=> 'ContenidoTematico',
	'id'=> 'ContenidoTematico',
	'placeholder' =>'Contenido Tematico',
	);
$evaluaciones= array(
	'name'=> 'evaluaciones',
	'id'=> 'evaluaciones',
	'placeholder' =>'Evaluaciones',
	);
$boton = array(
	'name'=> 'enviar',
	'id'=> 'enviar',
	'value'=>'Enviar',
       
        
	);

?>
        <table>
            <tr>
                <td>
                <?= form_label('Unidad','unidad') ?>
            
                </td>
                <td>
                    <?= form_label('Semana','semana') ?>
                  
                </td>
            </tr>
            <tr>
                <td>
                    <?= form_label('Objetivo Especifico','obj_esp') ?>
                  
                </td>

                <td>
                    <?= form_label('Contenido Tematico','contTematico') ?>
                    
                </td>
                
                <td>
                    <?= form_label('Evaluaciones','evaluaciones') ?>
                    
                </td>
                
               

</tr>

       <tr>
                <td>
                    <?= form_input($unidad)?>
                </td>
                <td>
                    <?= form_input($semana)?>
                </td>
                <td>
                    <?= form_input($obj_esp)?>
                </td>

                <td>
                   <?= form_input($contTematico)?>
                </td>
                
                <td>
                    <?= form_input($evaluaciones)?>
                </td>
           
</tr>

        </table>
       
      <?= form_submit($boton)?>
    </body>
</html>
