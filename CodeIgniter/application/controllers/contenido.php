<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Contenido extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('form');
        $this->load->model('contenido_model');
    }

    public function index() {
        $this->load->view('Contenido/contenido');
    }

    public function crear() {
        if ($this->input->post()) {
            $this->form_validation->set_rules('unidad', 'Unidad', 'required');
            $this->form_validation->set_rules('semana_anual', 'Semana Anual', 'required');
            $this->form_validation->set_rules('semana_semestral', 'Semana Semestral', 'required');
            $this->form_validation->set_rules('objetivos', 'Obejtivos', 'required');
            $this->form_validation->set_rules('fechainicio', 'Fecha Inicio', 'required');
            $this->form_validation->set_rules('fechatermino', 'Fecha Termino', 'required');
            $this->form_validation->set_rules('ContenidoTematico', 'Contenido Tematico', 'required');
            $this->form_validation->set_rules('evaluaciones', 'Evaluaciones', 'required');
            

            if ($this->form_validation->run()) {
                //phpinfo(); exit();
                $data = array(
                    'num_semana_anual' => $this->input->post('semana_anual'),
                    'num_sem_semestral' => $this->input->post('semana_semestral'),
                    'fecha_iniciosemana' => $this->input->post('fechainicio'),
                    'fecha_terminosemana' => $this->input->post('fechatermino'),
                    'unidad' => $this->input->post('unidad'),
                    'objetivos_esp' => $this->input->post('obejtivos'),
                    'contenido_tematico' => $this->input->post('ContenidoTematico'),
                    'evaluaciones' => $this->input->post('evaluaciones'),
                    'cod_clasificacion' => $this->input->post('planificacion'),
                );

                $query = $this->contenido_model->crear($data);
                if ($query === TRUE) {
                    redirect(base_url('index.php/contenido'));
                } else {
                    show_404();
                }
            }


            $this->load->view('Contenido/contenido');
        }
    }

}
