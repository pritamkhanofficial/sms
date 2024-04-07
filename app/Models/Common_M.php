<?php

namespace App\Models;

use CodeIgniter\Model;

class Common_M extends Model
{
    public function checkTableExists($table){
        try {
            return $this->db->tableExists($table);
        } catch (DatabaseException $th) {
            throw $th;
        }
    }
    
    public function fetch_navbar($user_role, $uid){
        if($user_role == 1){ // admin

            $rs = $this->db
                ->table('master_menu')
                ->select('menu_module, menu_name, menu_slug, show_on_left_nav, 1 as action_button_1, 1 as action_button_2')
                ->where(['master_menu.row_status' => 1])
                ->get()->getResult();    
                
        }else{

            $rs = $this
                ->select('menu_module, menu_name, menu_slug, show_on_left_nav, action_button_1, action_button_2, menu_permission.user_id')
                ->join('master_menu','master_menu.id = menu_permission.master_menu_id','left')
                ->where(['user_id' => $uid, 'block' => 0, 'master_menu.row_status' => 1, 'menu_permission.row_status' => 1])
                ->get()->getResult();
                
        }

        // echo $this->getLastQuery()->getQuery(); die;
        return $rs;

    }
    
    public function data_count($table, $condition){
        try {
            if(!empty($table)){
                if(!empty($condition)){
                    return $this->db->table($table)->where($condition)->get()->getNumRows();
                }
                return $this->db->table($table)->get()->getNumRows();
            }
            return 0;
        } catch (DatabaseException $th) {
            throw $th;
        }
    }
    public function data_current_row($table, $condition) {
        try {
            if(!empty($table)){
                if(!empty($condition)){
                    return $this->db->table($table)->where($condition)->get()->getRow();
                }
                return $this->db->table($table)->get()->getRow();
            }
            return [];
        } catch (DatabaseException $th) {
            throw $th;
        }
    }
    public function data_first_row($table, $condition) {
        try {
            if(!empty($table)){
                if(!empty($condition)){
                    return $this->db->table($table)->where($condition)->get()->getFirstRow();
                }
                return $this->db->table($table)->get()->getFirstRow();
            }
            return [];
        } catch (DatabaseException $th) {
            throw $th;
        }
    }

    public function data_last_row($table, $condition) {
        try {
            if(!empty($table)){
                if(!empty($condition)){
                    return $this->db->table($table)->where($condition)->get()->getLastRow();
                }
                return $this->db->table($table)->get()->getLastRow();
            }
            return [];
        } catch (DatabaseException $th) {
            throw $th;
        }
    }

    public function data_all($table, $condition, $order = NULL) {
        try {
            if(!empty($table)){
                $builder = $this->db->table($table);
                if(!empty($condition)){
                    $builder->where($condition);
                }
                if(!is_null($order)){
                    $builder->orderBy($order);
                }
                return $builder->get()->getResult();
            }
            return [];
        } catch (DatabaseException $th) {
            throw $th;
        }
    }

    public function data_insert($table, $array){
        try {
            if(!empty($table)){
                if(!empty($array)){

                    if($this->db->table($table)->insert($array)){
                        return $this->db->insertID();
                    }
                    return 0;
                }
            }
            return false;
        } catch (DatabaseException $th) {
            throw $th;
        }
    }


    public function data_update($table, $update_cond, $array){

        try {
            if(!empty($table)){
                if(!empty($array) && !empty($update_cond)){
                    return $this->db->table($table)->where($update_cond)->set($array)->update();
                }
            }else{
                return false;
            }
        } catch (DatabaseException $th) {
            // echo $this->getLastQuery()->getQuery(); die;
            throw $th;
        }
    }

    public function data_remove($table_id, $delete_condition){
        $this->db->table($table_id)->where($delete_condition)->delete();
        return true;
    }

    public function value_increment($table_id, $pk, $pk_value, $field, $increment_by){
        $this->db->table($table_id)->where($pk, $pk_value)->set($field, $field . '+' . $increment_by,FALSE)->update();
    }
    
    public function LogInsert($insertArray){
        return $this->db->table('user_activity_logs')->insert($insertArray);
    }
}