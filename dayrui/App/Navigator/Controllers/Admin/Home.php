<?php namespace Phpcmf\Controllers\Admin;


class Home extends \Phpcmf\Table
{
    private $tid;
    private $type;
    private $navigator;

    public function __construct(...$params) {
        parent::__construct(...$params);
        // 当前导航id
        $this->tid = (int)\Phpcmf\Service::L('Input')->get('tid');
        // 全部导航名称
        $data = \Phpcmf\Service::M('Site')->config(SITE_ID);
        $this->type = $data['navigator'] ? $data['navigator'] : [];
        // 支持附表存储
        $this->is_data = 0;
        // url中固定参数
        $this->url_params = [
            'tid' => $this->tid,
        ];
        // 模板前缀(避免混淆)
        $this->tpl_prefix = 'navigator_';
        // 模块显示名称
        $this->name = dr_lang('自定义链接');
        $this->navigator = \Phpcmf\Service::L('cache')->get('navigator-'.SITE_ID, $this->tid);
        // 初始化数据表
        $this->_init([
            'table' => SITE_ID.'_navigator',
            'field' => \Phpcmf\Service::L('cache')->get('navigator-'.SITE_ID.'-field'),
            'sys_field' => ['thumb'],
            'show_field' => 'name',
            'where_list' => 'type='.$this->tid,
            'order_by' => 'displayorder ASC,id ASC',
        ]);
        // 写入模板
        \Phpcmf\Service::V()->assign([
            'menu' => \Phpcmf\Service::M('auth')->_navigator_menu(
                $this->type,
                ' <i class="fa fa-link"></i> '.$this->type[$this->tid],
                \Phpcmf\Service::L('Router')->url('navigator/home/index', ['tid' => $this->tid]),
                \Phpcmf\Service::L('Router')->url('navigator/home/add', ['tid' => $this->tid])
            ),
            'type_name' => $this->type[$this->tid],
        ]);
    }

    // ========================

    // 获取树形结构列表
    protected function _get_tree_list($data) {

        $tree = [];
        foreach($data as $t) {
            // url
            $option = '';
            $this->_is_admin_auth('add') && $option.= '<a class="btn btn-xs blue" href='.\Phpcmf\Service::L('Router')->url('navigator/home/add', array('pid' => $t['id'], 'tid' => $this->tid)).'> <i class="fa fa-plus"></i> '.dr_lang('添加下级').'</a>';
            $this->_is_admin_auth('edit') && $option.= '<a class="btn btn-xs green" href='.\Phpcmf\Service::L('Router')->url('navigator/home/edit', array('id' => $t['id'], 'tid' => $this->tid)).'> <i class="fa fa-edit"></i> '.dr_lang('修改').'</a>';
            $t['option'] = $option;
            // 判断显示和隐藏开关
            $t['is_show_html'] = '<a href="javascript:;" onclick="dr_cat_ajax_show_open_close(this, \''.\Phpcmf\Service::L('Router')->url('navigator/home/show_edit', ['id'=>$t['id']]).'\', 0);" class="badge badge-'.(!$t['show'] ? 'no' : 'yes').'"><i class="fa fa-'.(!$t['show'] ? 'times' : 'check').'"></i></a>';
            // 判断是否新窗口
            $t['is_target_html'] = '<a href="javascript:;" onclick="dr_cat_ajax_open_close(this, \''.\Phpcmf\Service::L('Router')->url('navigator/home/target_edit', ['id'=>$t['id']]).'\', 0);" class="dr_is_page_html badge badge-'.(!$t['target'] ? 'no' : 'yes').'"><i class="fa fa-'.(!$t['target'] ? 'times' : 'check').'"></i></a>';
            $tree[$t['id']] = $t;
        }

        $str = "<tr>";
        $this->_is_admin_auth('del') && $str.= "<td class='myselect'>
                    <label class='mt-table mt-table mt-checkbox mt-checkbox-single mt-checkbox-outline'>
                        <input type='checkbox' class='checkboxes' name='ids[]' value='\$id' />
                        <span></span>
                    </label>
                </td>";
        $str.= "<td style='text-align:center'> <input type='text' onblur='dr_cat_ajax_save(this.value, \$id)' value='\$displayorder' class='displayorder form-control input-sm input-inline input-mini'> </td>";
        $str.= "<td style='text-align:center'>\$is_show_html</td>";
        $str.= "<td style='text-align:center'>\$id</td>";
        $str.= "<td>\$spacer<a target='_blank' href='\$url'>\$name</a></td>";
        $str.= "<td style='text-align:center'>\$is_target_html</td>";
        $str.= "<td>\$option</td>";
        $str.= "</tr>";


        return \Phpcmf\Service::L('tree')->init($tree)->get_tree(0, $str);
    }

    // 后台查看列表
    public function index() {

        \Phpcmf\Service::M('navigator', APP_DIR)->repair();

        list($tpl, $data) = $this->_List([], -1);

        \Phpcmf\Service::V()->assign([
            'list' => $this->_get_tree_list($data['list']),
        ]);
        \Phpcmf\Service::V()->display($tpl);
    }

    // 保存导航名称
    public function config_edit() {

        if (IS_AJAX_POST) {
            \Phpcmf\Service::M('Site')->config(SITE_ID, 'navigator', \Phpcmf\Service::L('Input')->post('data'));
            \Phpcmf\Service::L('Input')->system_log('设置网站自定义链接参数');
            $this->_json(1, dr_lang('操作成功'));
            exit;
        }

        \Phpcmf\Service::V()->assign([
            'type' => $this->type,
            'form' =>  dr_form_hidden(),
        ]);
        \Phpcmf\Service::V()->display('navigator_config.html');exit;
    }


    // 后台添加内容
    public function add() {

        $id = 0;
        $pid = intval(\Phpcmf\Service::L('Input')->get('pid'));
        $page = intval(\Phpcmf\Service::L('Input')->get('page'));
        $pid && !$this->navigator[$pid] && $this->_admin_msg(0, dr_lang('自定义链接【%s】缓存不存在', $pid));

        list($tpl) = $this->_Post($id, [], 1);

        \Phpcmf\Service::V()->assign([
            'form' =>  dr_form_hidden(['page' => $page]),
            'select' => \Phpcmf\Service::L('tree')->select_category($this->navigator, $pid, 'name=\'data[pid]\'', dr_lang('顶级导航')),
        ]);
        \Phpcmf\Service::V()->display($tpl);
    }

    // 后台修改内容
    public function edit() {

        $id = intval(\Phpcmf\Service::L('Input')->get('id'));
        $page = intval(\Phpcmf\Service::L('Input')->get('page'));

        list($tpl, $data) = $this->_Post($id, null, 1);
        !$data['data'] && $this->_admin_msg(0, dr_lang('数据#%s不存在', $id));

        \Phpcmf\Service::V()->assign([
            'form' =>  dr_form_hidden(['page' => $page]),
            'select' => \Phpcmf\Service::L('tree')->select_category($this->navigator, $data['data']['pid'], 'name=\'data[pid]\'', dr_lang('顶级导航')),
        ]);
        \Phpcmf\Service::V()->display($tpl);
    }



    // 后台删除内容
    public function del() {
        parent::_Del(
            \Phpcmf\Service::L('Input')->get_post_ids(),
            null,
            function ($r) {
                \Phpcmf\Service::M('navigator', APP_DIR)->cache();
            },
            \Phpcmf\Service::M()->dbprefix($this->init['table'])
        );
    }

    // 后台批量保存排序值
    public function order_edit() {
        $this->_Display_Order(
            intval(\Phpcmf\Service::L('Input')->get('id')),
            intval(\Phpcmf\Service::L('Input')->get('value')),
            function ($r) {
                \Phpcmf\Service::M('navigator', APP_DIR)->cache();
            }
        );
    }

    // 后台批量保存显示状态
    public function show_edit() {

        $id = (int)\Phpcmf\Service::L('Input')->get('id');
        $row = \Phpcmf\Service::M()->table(SITE_ID.'_navigator')->get($id);
        !$row && $this->_json(0, dr_lang('数据#%s不存在', $id));

        $v = $row['show'] ? 0 : 1;
        \Phpcmf\Service::M()->table(SITE_ID.'_navigator')->update($id, ['show' => $v]);

        $name = $v ? '显示状态' : '隐藏状态';
        \Phpcmf\Service::M('navigator', APP_DIR)->cache();
        \Phpcmf\Service::L('Input')->system_log('修改链接显示状态: '. $name);
        exit($this->_json(1, $name, ['value' => dr_lang($v)]));
    }

    // 后台批量保存是否生成静态的状态
    public function target_edit() {

        $id = (int)\Phpcmf\Service::L('Input')->get('id');
        $row = \Phpcmf\Service::M()->table(SITE_ID.'_navigator')->get($id);
        !$row && $this->_json(0, dr_lang('数据#%s不存在', $id));

        $v = $row['target'] ? 0 : 1;
        $name = $v ? '新窗口打开' : '当前窗口打开';

        $setting['html'] = $v;
        \Phpcmf\Service::M()->table(SITE_ID.'_navigator')->update($id, ['target' => $v ]);
        \Phpcmf\Service::M('navigator', APP_DIR)->cache();
        \Phpcmf\Service::L('Input')->system_log('修改链接的状态为: '. $name);
        exit($this->_json(1, dr_lang($name), ['value' => dr_lang($v)]));
    }




    // ===========================


    /**
     * 保存内容
     * $id      内容id,新增为0
     * $data    提交内容数组,留空为自动获取
     * $func    格式化提交的数据
     * */
    protected function _Save($id = 0, $data = [], $old = [], $func = null, $func2 = null) {

        return parent::_Save($id, $data, $old,
            function ($id, $data){
                // 保存之前的判断
                $save = \Phpcmf\Service::L('Input')->post('data');
                if (!$save['name']) {
                    return dr_return_data(0, dr_lang('名称不能为空'), ['field' => 'name']);
                } elseif (!$save['title']) {
                    return dr_return_data(0, dr_lang('标题不能为空'), ['field' => 'title']);
                } elseif (!$save['url']) {
                    return dr_return_data(0, dr_lang('地址不能为空'), ['field' => 'url']);
                } elseif (\Phpcmf\Service::M('navigator', APP_DIR)->check_mark($this->tid, $id, $save['mark'])) {
                    return dr_return_data(0, dr_lang('标识字符必须唯一'), ['field' => 'mark']);
                }
                $save['type'] = $this->tid;
                if (!$id) {
                    // 默认数据
                    $save['show'] = 1;
                    $save['target'] = 1;
                    $save['displayorder'] = 0;
                    $save['extend'] = 0;
                    $save['child'] = 0;
                    $save['childids'] = '';
                }

                foreach ($data[1] as $n => $t) {
                    $save[$n] = $t ? $t : '';
                }

                return dr_return_data(1, '', [1 => $save]);
            },function ($id, $data, $old) {

                \Phpcmf\Service::M('navigator', APP_DIR)->cache();
            }
        );
    }
}
