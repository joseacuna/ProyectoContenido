<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Planificacion_model extends CI_Model{
    function __construct() {
        parent::__construct();
        $this->load->database();
    }
    function crearProfesor($data){
        $this->db->insert('profesor',array('rut'=>$data['rut'],'nombre'=>$data['nombre'],'apellido_paterno'=>$data['apellido1'],'apellido_materno'=>$data['apellido2'],'id_escuela'=>$data['escuela']));
    }
}


