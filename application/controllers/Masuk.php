<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Masuk extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->Model('Masuk_m');
        if ($this->session->userdata('logged_in') == true) {
            redirect('satuan', 'refresh');
        }
    }

    public function index()
    {
        $data['title'] = "Diseminasi | Masuk";
        $data['id_role'] = $this->db->get('data_role')->result();
        $this->load->view('v_masuk', $data);
    }

    public function logindiseminasi()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('email', 'Email', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');
        if ($this->form_validation->run()) {
            //true
            $email = $this->input->post('email');
            $password = $this->input->post('password');
            $nip = $this->input->post('nip');
            $this->load->Model('Masuk_m');
            if ($this->Masuk_m->bisaloginadmin($email, $password)) {
                redirect('satuan');
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible" role="alert" style="width:80%; margin-left: 50px">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> Email atau Kata Sandi Salah!</div>');
                redirect('masuk');
            }
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible" role="alert" style="width:80%; margin-left: 50px">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> Email atau Kata Sandi Salah!</div>');
            redirect('masuk');
        }
    }

    public function blok()
    {
        echo "blok";
    }
}
