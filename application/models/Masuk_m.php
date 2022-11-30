<?php
class Masuk_m extends CI_model
{
    public function bisaloginadmin($email, $password)
    {
        $query = $this->db->where('email', $email)->where('password', md5($password))->where('role', 'Admin Bahan Diseminasi')->get('detail_role');
        if ($query->num_rows() > 0) {
            $data = array(
                'email'    => $query->row()->email,
                'password'    => $query->row()->password,
                'logged_in'    => true,
                'role'        => $query->row()->role,
                'nip'        => $query->row()->nip
            );

            $this->session->set_userdata($data);
            return true;
        } else {
            return false;
        }
    }
}
