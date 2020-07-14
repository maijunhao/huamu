<?php namespace Phpcmf\Controllers\Admin;


class Home extends \Phpcmf\Table
{
    private $page;

    public function __construct(...$params) {
        parent::__construct(...$params);
        // 支持附表存储
        $this->is_data = 0;
        // 模板前缀(避免混淆)
        $this->tpl_prefix = 'page_';
        // 单独模板命名
        $this->tpl_name = 'page_content';
        // 模块显示名称
        $this->name = dr_lang('自定义页面');
        // 单页缓存数据
        $this->page = \Phpcmf\Service::L('cache')->get('page-'.SITE_ID, 'data');
        // 初始化数据表
        $this->_init([
            'table' => SITE_ID.'_page',
            'field' => \Phpcmf\Service::L('cache')->get('page-'.SITE_ID.'-field'),
            'sys_field' => ['thumb'],
            'show_field' => 'name',
            'order_by' => 'displayorder ASC,id ASC',
        ]);
        \Phpcmf\Service::M('Page', 'page')->init($this->init); // 初始化内容模型
        // 写入模板
        \Phpcmf\Service::V()->assign([
            'menu' => \Phpcmf\Service::M('auth')->_admin_menu([
                '自定义页面' => [APP_DIR.'/'.\Phpcmf\Service::L('Router')->class.'/index', 'fa fa-safari'],
                '添加' => [APP_DIR.'/'.\Phpcmf\Service::L('Router')->class.'/add', 'fa fa-plus'],
                '修改' => ['hide:'.APP_DIR.'/'.\Phpcmf\Service::L('Router')->class.'/edit', 'fa fa-edit'],
                '自定义URL' => [APP_DIR.'/'.\Phpcmf\Service::L('Router')->class.'/url_edit', 'fa fa-link'],
                '自定义字段' => ['url:'.\Phpcmf\Service::L('Router')->url('field/index', ['rname'=>'page', 'rid'=>SITE_ID]), 'fa fa-code'],
                'help' => [362]
            ]),
        ]);
    }

    // ========================

    // 获取树形结构列表
    protected function _get_tree_list($data) {

        $tree = [];
        foreach($data as $t) {
            $t['setting'] = dr_string2array($t['setting']);
            if ($t['setting']['html'] && $t['setting']['html_domain']) {
                $domain = strpos($t['setting']['html_domain'], 'http') === 0 ? $t['setting']['html_domain'] : dr_http_prefix($t['setting']['html_domain']);
                $t['url'] = dr_url_prefix($t['url'], $domain);
            }
            $option = '';
            $this->_is_admin_auth('add') && $option.= '<a class="btn btn-xs blue" href='.\Phpcmf\Service::L('Router')->url(APP_DIR.'/'.'home/add', array('pid' => $t['id'])).'> <i class="fa fa-plus"></i> '.dr_lang('添加下级').'</a>';
            $this->_is_admin_auth('edit') && $option.= '<a class="btn btn-xs green" href='.\Phpcmf\Service::L('Router')->url(APP_DIR.'/'.'home/edit', array('id' => $t['id'])).'> <i class="fa fa-edit"></i> '.dr_lang('修改').'</a>';
            $t['option'] = $option;
            // 判断显示和隐藏开关
            $t['is_show_html'] = '<a href="javascript:;" onclick="dr_cat_ajax_show_open_close(this, \''.\Phpcmf\Service::L('Router')->url(APP_DIR.'/'.'home/show_edit', ['id'=>$t['id']]).'\', 0);" class="badge badge-'.(!$t['show'] ? 'no' : 'yes').'"><i class="fa fa-'.(!$t['show'] ? 'times' : 'check').'"></i></a>';
            // 判断是否生成静态
            $t['is_page_html'] = '<a href="javascript:;" onclick="dr_cat_ajax_open_close(this, \''.\Phpcmf\Service::L('Router')->url(APP_DIR.'/'.'home/html_edit', ['id'=>$t['id']]).'\', 0);" class="dr_is_page_html badge badge-'.(!$t['setting']['html'] ? 'no' : 'yes').'"><i class="fa fa-'.(!$t['setting']['html'] ? 'times' : 'check').'"></i></a>';
            $tree[$t['id']] = $t;
        }

        $str = "<tr class='\$class'>";
        $this->_is_admin_auth('del') && $str.= "<td class='myselect'>
                    <label class='mt-table mt-table mt-checkbox mt-checkbox-single mt-checkbox-outline'>
                        <input type='checkbox' class='checkboxes' name='ids[]' value='\$id' />
                        <span></span>
                    </label>
                </td>";
        $str.= "<td style='text-align:center'> <input type='text' onblur='dr_cat_ajax_save(this.value, \$id)' value='\$displayorder' class='displayorder form-control input-sm input-inline input-mini'> </td>";
        $str.= "<td style='text-align:center'>\$is_show_html</td>";
        $str.= "<td style='text-align:center'>\$id</td>";
        $str.= "<td>\$spacer<a target='_blank' href='\$url'>\$name</a> \$parent</td>";
        $str.= "<td style='text-align:center'>\$is_page_html</td>";
        $str.= "<td>\$option</td>";
        $str.= "</tr>";


        return \Phpcmf\Service::L('tree')->init($tree)->get_tree(0, $str);
    }

    // 后台查看列表
    public function index() {


        list($tpl, $data) = $this->_List([], -1);
        $data['list'] && $data['list'] = \Phpcmf\Service::M('page', 'page')->repair($data['list']);

        dr_html_auth(1);

        \Phpcmf\Service::V()->assign([
            'list' => $this->_get_tree_list($data['list']),
        ]);
        \Phpcmf\Service::V()->display($tpl);
    }

    // 后台添加内容
    public function add() {

        $id = 0;
        $pid = intval(\Phpcmf\Service::L('Input')->get('pid'));
        $page = intval(\Phpcmf\Service::L('Input')->get('page'));
        $value = array(
            'show' => 1,
        );
        $pid && !$this->page[$pid] && $this->_admin_msg(0, dr_lang('自定义页面【%s】缓存不存在', $pid));

        list($tpl) = $this->_Post($id, $value, 1);

        \Phpcmf\Service::V()->assign([
            'page' => $page,
            'form' =>  dr_form_hidden(['page' => $page]),
            'select' => \Phpcmf\Service::L('tree')->select_category($this->page, $pid, 'name=\'data[pid]\'', dr_lang('顶级页面')),
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
            'page' => $page,
            'form' =>  dr_form_hidden(['page' => $page]),
            'select' => \Phpcmf\Service::L('tree')->select_category($this->page, $data['data']['pid'], 'name=\'data[pid]\'', dr_lang('顶级页面')),
        ]);
        \Phpcmf\Service::V()->display($tpl);
    }

    // 自定义url
    public function url_edit() {

        if (IS_AJAX_POST) {

            $c = 0;
            $catid = \Phpcmf\Service::L('Input')->post('catid');
            $urlrule = \Phpcmf\Service::L('Input')->post('urlrule');

            foreach ($this->page as $id => $t) {
                if (in_array($id, $catid)) {
                    $c ++;
                    $t['setting']['urlrule'] = $urlrule;
                    \Phpcmf\Service::M('Page', 'page')->init($this->init)->update($id, ['setting' => dr_array2string($t['setting'])]);
                }
            }

            \Phpcmf\Service::M('page', APP_DIR)->cache();
            $this->_json(1, dr_lang('批量设置%s个页面', $c));
        }

        \Phpcmf\Service::V()->assign([
            'form' =>  dr_form_hidden(),
            'select' => \Phpcmf\Service::L('tree')->select_category($this->page, 0, 'name=\'catid[]\' multiple style=\'height:200px\'', ''),

        ]);
        \Phpcmf\Service::V()->display('page_url.html');

    }

    // 后台删除内容
    public function del() {

        $ids = \Phpcmf\Service::L('Input')->get_post_ids();
        !$ids && $this->_json(0, dr_lang('所选内容不存在'));

        // 重新获取数据
        $page = \Phpcmf\Service::M('Page', 'page')->cache();

        // 筛选id
        $catid = '';
        foreach ($ids as $id) {
            $catid.= ','.($page['data'][$id]['childids'] ? $page['data'][$id]['childids'] : $id);
        }

        $catid = explode(',', trim($catid, ','));
        $catid = array_flip(array_flip($catid));

        parent::_Del(
            $catid,
            null,
            function ($rows) {
                // 删除之后记得删除相关模块数据
                \Phpcmf\Service::M('page', APP_DIR)->cache();
                return dr_return_data(1);
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
                \Phpcmf\Service::M('page', APP_DIR)->cache();
            }
        );
    }

    // 后台批量保存显示状态
    public function show_edit() {

        $id = (int)\Phpcmf\Service::L('Input')->get('id');
        $row = \Phpcmf\Service::M('Page', 'page')->get($id);
        !$row && $this->_json(0, dr_lang('自定义页面数据不存在'));

        $v = $row['show'] ? 0 : 1;
        \Phpcmf\Service::M('Page', 'page')->update($id, ['show' => $v]);

        $name = dr_lang($v ? '显示状态' : '隐藏状态');
        \Phpcmf\Service::M('page', APP_DIR)->cache();
        \Phpcmf\Service::L('Input')->system_log('修改自定义页面的显示状态: '. $name);
        exit($this->_json(1, $name, ['value' => $v]));
    }

    // 后台批量保存是否生成静态的状态
    public function html_edit() {

        $id = (int)\Phpcmf\Service::L('Input')->get('id');
        $row = \Phpcmf\Service::M('Page', 'page')->get($id);
        !$row && $this->_json(0, dr_lang('自定义页面数据不存在'));

        $setting = dr_string2array($row['setting']);

        $v = $setting['html'] ? 0 : 1;
        $name = $v ? '静态模式' : '动态模式';

        $setting['html'] = $v;
        \Phpcmf\Service::M('Page', 'page')->table(SITE_ID.'_page')->update($id,[
            'setting' => dr_array2string($setting)
        ]);
        // 重新生成缓存
        \Phpcmf\Service::M('Page', 'page')->cache(SITE_ID);
        \Phpcmf\Service::L('Input')->system_log('修改自定义页面的状态为: '. $name);
        exit($this->_json(1, dr_lang($name), ['value' => $v]));
    }




    // ===========================

    /**
     * 获取内容
     * $id      内容id,新增为0
     * */
    protected function _Data($id = 0) {

        $row = \Phpcmf\Service::M('Page', 'page')->get($id);
        if (!$row) {
            return [];
        }

        $row['setting'] = dr_string2array($row['setting']);

        return $row;
    }

    /**
     * 回调处理结果
     * $data
     * */
    protected function _Call_Post($data) {

        // 生成权限文件
        !dr_html_auth(1) && $this->_json(0, dr_lang('/cache/html/ 无法写入文件'));

        $html = '';
        $data[1]['setting'] = dr_string2array($data[1]['setting']);
        $data[1]['setting']['html'] && $html = '/index.php?s=page&c=home&m=htmlfile&id='.$data[1]['id'];
        $this->_json(1, dr_lang('操作成功'), ['htmlfile' => $html]);
    }

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
                } elseif (!$save['dirname']) {
                    return dr_return_data(0, dr_lang('目录名称不能为空'), ['field' => 'dirname']);
                } elseif (\Phpcmf\Service::M('Page', 'page')->check_dirname($id, $save['dirname'])) {
                    return dr_return_data(0, dr_lang('目录名称不可用'), ['field' => 'dirname']);
                }

                // 默认数据
                $save['show'] = (int)$save['show'];
                foreach ($data[1] as $n => $t) {
                    $save[$n] = $t ? $t : '';
                }

                // 数组json化
                $save['setting'] = dr_array2string($save['setting']);
                $save['pids'] = '';
                $save['pdirname'] = '';
                $save['childids'] = '';
                $save['url'] = '/#'.dr_lang('更新缓存生效');
                $save['child'] = 0;

                if (!$id) {
                    $save['displayorder'] = 0;
                } else {
                    unset($save['displayorder']);
                }

                return dr_return_data(1, '', [1 => $save]);
            }, function ($id, $data, $old) {

                \Phpcmf\Service::M('page', APP_DIR)->cache();
            }
        );
    }

    // 生成单页
    public function page_index() {

        $this->member_cache['auth_site'][SITE_ID]['home'] && $this->_json(0, '当前网站设置了访问权限，无法生成静态');
        dr_html_auth(1);
        \Phpcmf\Service::V()->assign([
            'todo_url' => '/index.php?s=page&c=home&m=htmlfile',
            'count_url' =>\Phpcmf\Service::L('Router')->url('page/home/page_count_index'),
        ]);
        \Phpcmf\Service::V()->display('html_bfb.html');exit;
    }

    // 单页生成的数量统计
    public function page_count_index() {
        $data = dr_save_bfb_data($this->get_cache('page-'.SITE_ID, 'data'));
        !dr_count($data) && $this->_json(0, '没有可用生成的自定义页面数据');
        \Phpcmf\Service::L('cache')->init()->save('page-html-file', $data, 3600);
        $this->_json(1, 'ok');
    }
}
