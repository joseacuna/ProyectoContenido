/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var campos = 1;
function agregarCampo(){
  campos = campos + 1;
  var NvoCampo= document.createElement("div");
  NvoCampo.id= "divcampo_"+(campos);
  NvoCampo.innerHTML= 
     "<tr>"+
     "    <td>"+
     "     <?= form_input($unidad)?>"+
     "     </td>"+
     "      <td>"+
      "       <?= form_input($semana)?>"+
                "</td>"+
                "<td>"+
                    "<?= form_input($obj_esp)?>"+
                "</td>"+

                "<td>"+
                   "<?= form_input($contTematico)?>"+
                "</td>"+
                
                "<td>"+
                    "<?= form_input($evaluaciones)?>"+
                "</td>"+
"</tr>";
   var contenedor= document.getElementById("contenedor");
   contenedor.appendChild(NvoCampo);
}
//elimina los campos
function quitarCampo(iddiv){
  var eliminar = document.getElementById("divcampo_" + iddiv);
  var contenedor= document.getElementById("contenedorcampos");
  contenedor.removeChild(eliminar);
}