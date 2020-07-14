<?php namespace Phpcmf\Model\Navigator;

// 导航链接模型类

class Navigator extends \Phpcmf\Model
{

    protected $tablename;
    protected $categorys;


    public function __construct(...$params)
    {
        parent::__construct(...$params);

        $this->tablename = SITE_ID.'_navigator';
    }

    // 设置默认表
    public function set_siteid($id) {
        $this->tablename = $id.'_navigator';
        return $this;
    }

    // 检查标致
    public function check_mark($tid, $id, $value) {

        if (!$value) {
            return 0;
        }

        return $this->table($this->tablename)->where('type', $tid)->is_exists($id, 'mark', $value);
    }


    /**
     * 找出子目录列表
     *
     * @param	array	$data
     * @return	bool
     */
    private function get_categorys($data = array()) {

        if (is_array($data) && !empty($data)) {
            foreach ($data as $catid => $c) {
                $this->categorys[$catid] = $c;
                $result = array();
                foreach ($this->categorys as $_k => $_v) {
                    $_v['pid'] && $result[] = $_v;
                }
            }
        }

        return true;
    }

    /**
     * 获取父栏目ID列表
     *
     * @param	integer	$catid	栏目ID
     * @param	array	$pids	父目录ID
     * @param	integer	$n		查找的层次
     * @return	string
     */
    private function get_pids($catid, $pids = '', $n = 1) {

        if ($n > 5 || !is_array($this->categorys)
            || !isset($this->categorys[$catid])) {
            return FALSE;
        }

        $pid = $this->categorys[$catid]['pid'];
        $pids = $pids ? $pid.','.$pids : $pid;
        $pid ? $pids = $this->get_pids($pid, $pids, ++$n) : $this->categorys[$catid]['pids'] = $pids;

        return $pids;
    }

    /**
     * 获取子栏目ID列表
     *
     * @param	$catid	栏目ID
     * @return	string
     */
    private function get_childids($catid) {

        $childids = $catid;
        if (is_array($this->categorys)) {
            foreach ($this->categorys as $id => $cat) {
                $cat['pid'] && $id != $catid && $cat['pid'] == $catid && $childids.= ','.$this->get_childids($id);
            }
        }

        return $childids;
    }



    /**
     * 修复菜单数据
     */
    public function repair() {

        $this->categorys = $categorys = [];
        $_data = $this->table($this->tablename)->order_by('displayorder ASC,id ASC')->getAll();
        if (!$_data) {
            return;
        }

        foreach ($_data as $t) {
            $categorys[$t['id']] = $t;
        }

        $this->categorys = $categorys; // 全部栏目数据
        $this->get_categorys($categorys); // 查找子目录
        if (is_array($this->categorys)) {
            foreach ($this->categorys as $catid => $cat) {
                $pids = $this->get_pids($catid);
                $childids = $this->get_childids($catid);
                $child = is_numeric($childids) ? 0 : 1;
                if ($categorys[$catid]['pids'] != $pids
                    || $categorys[$catid]['childids'] != $childids
                    || $categorys[$catid]['child'] != $child) {
                    // 当库中与实际不符合才更新数据表
                    $this->table($this->tablename)->update($cat['id'], array(
                        'pids' => $pids,
                        'child' => $child,
                        'childids' => $childids
                    ));
                    $categorys[$catid]['pids'] = $pids;
                    $categorys[$catid]['childids'] = $childids;
                    $categorys[$catid]['child'] = $child;
                }
            }
        }

        return $categorys;
    }

    // 缓存
    public function cache($siteid = SITE_ID) {

        $url = $cache = [];

        // 全部栏目
        $data = $this->set_siteid($siteid)->repair();
        if ($data) {
            foreach ($data as $t) {
                $pid = explode(',', $t['pids']);
                $t['topid'] = isset($pid[1]) ? $pid[1] : $t['id'];
                $t['navids'] = explode(',', $t['childids']);
                $t['mark'] && $url[$t['type']][$t['mark']] = $t['id'];
                $cache[$t['type']][$t['id']] = $t;
            }
        }

        \Phpcmf\Service::L('cache')->set_file('navigator-'.$siteid, $cache);
        \Phpcmf\Service::L('cache')->set_file('navigator-'.$siteid.'-url', $url);

        // 自定义字段
        $cache2 = [];
        $field = $this->db->table('field')->where('disabled', 0)->where('relatedid', $siteid)->where('relatedname', 'navigator')->orderBy('displayorder ASC,id ASC')->get()->getResultArray();
        if ($field) {
            foreach ($field as $f) {
                $f['setting'] = dr_string2array($f['setting']);
                $cache2[$f['fieldname']] = $f;
            }
        }

        \Phpcmf\Service::L('cache')->set_file('navigator-'.$siteid.'-field', $cache2);

        return $cache;
    }



}