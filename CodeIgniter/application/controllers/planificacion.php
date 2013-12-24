<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Planificacion extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->helper('form');
        $this->load->model('planificacion_model');
    }
    function index()
    {
        $this->load->view('planificacion/bienvenido');
    }
    function nuevo(){
        //$this->load->view('planificacion/formulario');
        //$this->load->view('planificacion/index_pais');
       $this->load->view('planificacion/PlanifSemestral');
    }
    function recibirDatos(){
        $data = array(
            'rut'=> $this->input->post('rut'),
            'nombre'=> $this->input->post('nombre'),
            'apellido1'=> $this->input->post('apellido1'),
            'apellido2'=> $this->input->post('apellido2'),
            'escuela'=> $this->input->post('escuela')
        );
        $this->planificacion_model->crearProfesor($data);
                
    }
    
//    function recibirDatosContenido(){
//        $data = array(
//            'unidad'=> this->input->post('unidad'),
//            ''
//             
//        )
//    }


    //planificacion semestral
    
    function planificacionSemestral(){
        $this->load->view('planificacion/PlanifSemestral');
   }

}
?>
