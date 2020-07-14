<?php namespace Phpcmf\Model\Page;

// 单页模型类

class Page extends \Phpcmf\Model
{

    protected $tablename;
    protected $categorys;

    public function __construct(...$params)
    {
        parent::__construct(...$params);

        $this->tablename = SITE_ID.'_page';
    }

    // 设置默认表
    public function set_siteid($id) {
        $this->tablename = $id.'_page';
        return $this;
    }

    // 检查目录是否可用
    public function check_dirname($id, $value) {

        if (defined('SYS_PAGE_RNAME') && SYS_PAGE_RNAME) {
            return 0;
        } elseif (!$value) {
            return 1;
        } elseif (!preg_match('/^[a-z0-9]*$/i', $value)) {
            return 1;
        }

        return $this->table($this->tablename)->is_exists($id, 'dirname', $value);
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

        if ($n > 100 || !is_array($this->categorys)
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
    private function get_childids($catid, $n = 1) {

        $childids = $catid;

        if ($n > 100 || !is_array($this->categorys)
            || !isset($this->categorys[$catid])) {
            return $childids;
        }

        if (is_array($this->categorys)) {
            foreach ($this->categorys as $id => $cat) {
                $cat['pid'] && $id != $catid && $cat['pid'] == $catid && $childids.= ','.$this->get_childids($id, ++$n);
            }
        }

        return $childids;
    }

    /**
     * 所有父目录
     *
     * @param	$catid	��ĿID
     * @return	string
     */
    public function get_pdirname($catid) {

        if ($this->categorys[$catid]['pid'] == 0) {
            return '';
        }

        $t = $this->categorys[$catid];
        $pids = $t['pids'];
        $pids = explode(',', $pids);
        $catdirs = array();
        krsort($pids);

        foreach ($pids as $id) {
            if ($id == 0) {
                continue;
            }
            $catdirs[] = $this->categorys[$id]['dirname'];
            if ($this->categorys[$id]['pdirname'] == '') {
                break;
            }
        }
        krsort($catdirs);

        return implode('/', $catdirs).'/';
    }

    /**
     * 修复菜单数据
     */
    public function repair($_data = []) {

        $this->categorys = $categorys = [];
        if (!$_data) {
            $_data = $this->table($this->tablename)->order_by('displayorder ASC,id ASC')->getAll();
            if (!$_data) {
                return NULL;
            }
        }

        foreach ($_data as $t) {
            $t['setting'] = dr_string2array($t['setting']);
            $categorys[$t['id']] = $t;
        }

        $this->categorys = $categorys; // 全部栏目数据
        if (is_array($this->categorys)) {
            foreach ($this->categorys as $catid => $cat) {

                $this->categorys[$catid]['pids'] = $this->get_pids($catid);
                $this->categorys[$catid]['childids'] = $this->get_childids($catid);
                $this->categorys[$catid]['child'] = is_numeric($this->categorys[$catid]['childids']) ? 0 : 1;
                $this->categorys[$catid]['pdirname'] = $this->get_pdirname($catid);

                if ($cat['pdirname'] != $this->categorys[$catid]['pdirname']
                    || $cat['pids'] != $this->categorys[$catid]['pids']
                    || $cat['childids'] != $this->categorys[$catid]['childids']
                    || $cat['child'] != $this->categorys[$catid]['child']) {
                    // 当库中与实际不符合才更新数据表
                    // 更新数据库
                    $this->table($this->tablename)->update($cat['id'], array(
                        'pids' => $this->categorys[$catid]['pids'],
                        'child' => $this->categorys[$catid]['child'],
                        'childids' => $this->categorys[$catid]['childids'],
                        'pdirname' => $this->categorys[$catid]['pdirname']
                    ));
                }

                $pid = explode(',', $cat['pids']);
                $cat['topid'] = isset($pid[1]) ? $pid[1] : $cat['id'];
                if ($cat['topid'] && $cat['topid'] != $cat['id']) {
                    // 继承第一级的
                    $this->categorys[$catid]['setting']['html_domain'] = $this->categorys[$cat['topid']]['setting']['html_domain'];
                    $this->categorys[$catid]['setting']['html_mobile_domain'] = $this->categorys[$cat['topid']]['setting']['html_mobile_domain'];
                }
            }
        }

        return $this->categorys;
    }

    // 更新URL
    public function _update_url($data, $siteid = SITE_ID) {

        $data['setting'] = dr_string2array($data['setting']);
        $url = $data['setting']['urllink'] ? $data['setting']['urllink'] : \Phpcmf\Service::L('router')->page_url($data, 0, $siteid);
        $this->db->table($siteid.'_page')->where('id', $data['id'])->update(['url' => $url]);
        return $url;
    }

    // 缓存
    public function cache($siteid = SITE_ID) {


        if (!$this->db->table('field')->where('fieldname', 'attachment')->where('relatedid', $siteid)->where('relatedname', 'page')->orderBy('displayorder ASC,id ASC')->get()->getRowArray()) {
            $this->db->simpleQuery('INSERT INTO `'.$this->dbprefix('field').'` VALUES(NULL, \'相关附件\', \'attachment\', \'Files\', '.$siteid.', \'page\', 1, 1, 1, 1, 0, 0, \'a:2:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"80%\\";s:4:\\"size\\";s:1:\\"2\\";s:5:\\"count\\";s:2:\\"10\\";s:3:\\"ext\\";s:31:\\"jpg,gif,png,ppt,doc,xls,rar,zip\\";s:10:\\"uploadpath\\";s:0:\\"\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"0\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}}\', 0)');
        }

        if (!$this->db->table('field')->where('fieldname', 'content')->where('relatedid', $siteid)->where('relatedname', 'page')->orderBy('displayorder ASC,id ASC')->get()->getRowArray()) {
            $this->db->simpleQuery('INSERT INTO `'.$this->dbprefix('field').'` VALUES(NULL, \'页面内容\', \'content\', \'Ueditor\', '.$siteid.', \'page\', 1, 1, 1, 1, 0, 0, \'a:2:{s:6:\\"option\\";a:7:{s:5:\\"width\\";s:3:\\"90%\\";s:6:\\"height\\";s:3:\\"400\\";s:4:\\"mode\\";s:1:\\"1\\";s:4:\\"tool\\";s:0:\\"\\";s:5:\\"mode2\\";s:1:\\"1\\";s:5:\\"tool2\\";s:0:\\"\\";s:5:\\"value\\";s:0:\\"\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"1\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}}\', 0)');

        }


        $cache = [];

        // 全部栏目
        $data =  $this->set_siteid($siteid)->repair();
        if ($data) {
            foreach ($data as $t) {
                $attachment = dr_string2array($t['attachment']);
                $t['attachment'] = [];
                if ($attachment) {
                    foreach ($attachment['file'] as $i => $file) {
                        $t['attachment'][] = [
                            'file' => $file,
                            'title' => $attachment['title'][$i]
                        ];
                    }
                }
                $pid = explode(',', $t['pids']);
                $t['topid'] = isset($pid[1]) ? $pid[1] : $t['id'];
                if ($t['topid'] && $t['topid'] != $t['id']) {
                    // 继承第一级的
                    $t['setting']['html_dir'] = $data[$t['topid']]['setting']['html_dir'];
                    $t['setting']['html_domain'] = $data[$t['topid']]['setting']['html_domain'];
                    $t['setting']['html_mobile_domain'] = $data[$t['topid']]['setting']['html_mobile_domain'];
                }
                $t['url'] = $this->_update_url($t, $siteid);
                $t['pageids'] = explode(',', $t['childids']);
                $cache['data'][$t['id']] = $t;
                $cache['dir'][$t['dirname']] = $t['id'];
            }
        }

        \Phpcmf\Service::L('cache')->set_file('page-'.$siteid, $cache);

        // 自定义字段
        $cache2 = [];
        $field = $this->db->table('field')->where('disabled', 0)->where('relatedid', $siteid)->where('relatedname', 'page')->orderBy('displayorder ASC,id ASC')->get()->getResultArray();
        if ($field) {
            foreach ($field as $f) {
                $f['setting'] = dr_string2array($f['setting']);
                $cache2[$f['fieldname']] = $f;
            }
        }

        \Phpcmf\Service::L('cache')->set_file('page-'.$siteid.'-field', $cache2);

        return $cache;
    }



}