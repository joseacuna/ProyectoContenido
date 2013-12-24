<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Contenido</title>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script language="javascript" type="text/javascript"></script>
    </head>
    <body>
 <style type="text/css">
 
#tabla{	border: solid 1px #333;	width: 300px; }
#tabla tbody tr{ background: #999; }
.fila-base{ display: none; } /* fila base oculta */
.eliminar{ cursor: pointer; color: #000; }
input[type="text"]{ width: 80px; } /* ancho a los elementos input="text" */
 
</style>       
        
        
<script type="text/javascript">
 
$(function(){
	// Clona la fila oculta que tiene los campos base, y la agrega al final de la tabla
	$("#agregar").on('click', function(){
		$("#tabla tbody tr:eq(0)").clone().removeClass('fila-base').appendTo("#tabla tbody");
	});
 
	// Evento que selecciona la fila y la elimina 
	$(document).on("click",".eliminar",function(){
		var parent = $(this).parents().get(0);
		$(parent).remove();
	});
});
 
</script>      
        
 <table id="tabla">
	<!-- Cabecera de la tabla -->
	<thead>
		<tr>
			<th>Nombre</th>
			<th>Apellidos</th>
			<th>Sexo</th>
			<th>&nbsp;</th>
		</tr>
	</thead>
 
	<!-- Cuerpo de la tabla con los campos -->
	<tbody>
 
		<!-- fila base para clonar y agregar al final -->
		<tr class="fila-base">
			<td><input type="text" class="nombre" /></td>
			<td><input type="text" class="apellidos" /></td>
			<td>
				<select class="sexo">
					<option value="0">- Sexo -</option>
					<option value="M">Masculino</option>
					<option value="F">Femenino</option>
				</select>
			</td>
			<td class="eliminar">Eliminar</td>
		</tr>
		<!-- fin de código: fila base -->
 
		<!-- Fila de ejemplo -->
		<tr>
			<td><input type="text" class="nombre" /></td>
			<td><input type="text" class="apellidos" /></td>
			<td>
				<select class="sexo">
					<option value="0">- Sexo -</option>
					<option value="M">Masculino</option>
					<option value="F">Femenino</option>
				</select>
			</td>
			<td class="eliminar">Eliminar</td>
		</tr>
		<!-- fin de código: fila de ejemplo -->
 
	</tbody>
</table>
<!-- Botón para agregar filas -->
<input type="button" id="agregar" value="Agregar fila" />

    </body>
</html>
