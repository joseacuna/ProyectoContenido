<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Contenido_model extends CI_Model{
    function __construct() {
        parent::__construct();
        $this->load->database();
    }
    
    public function crear($datos)
    {
        $this->db->insert('contenido',$datos);
        return TRUE;
    }  
          
    
}