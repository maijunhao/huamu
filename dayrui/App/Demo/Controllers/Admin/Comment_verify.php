<?php namespace Phpcmf\Controllers\Admin;

class Comment_verify extends \Phpcmf\Admin\Comment
{

    public function index() {
        $this->_Admin_List();
    }

    public function edit() {
        $this->_Admin_Edit();
    }

    public function show_index() {
        $this->_Admin_Show();
    }

    public function del() {
        $this->_Admin_Del();
    }
    
    public function status_index() {
        $this->_Admin_Status();
    }
    
}
