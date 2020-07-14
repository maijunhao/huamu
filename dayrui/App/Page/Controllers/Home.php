<?php namespace Phpcmf\Controllers;

/**
 * PHPCMF框架文件
 * 二次开发时请勿修改本文件
 * 成都天睿信息技术有限公司 www.phpcmf.net
 */

class Home extends \Phpcmf\Common
{

    // 显示单页
    public function index() {

        if (SYS_CACHE && SYS_CACHE_PAGE && !defined('SC_HTML_FILE')) {
            // 启用页面缓存
            $this->cachePage(SYS_CACHE_PAGE * 3600);
        }

        // 开启ob函数
        ob_start();

        $data = $this->_get_page(
            (int)\Phpcmf\Service::L('Input')->get('id'),
            dr_safe_replace(\Phpcmf\Service::L('Input')->get('dir')),
            max(1, (int)\Phpcmf\Service::L('Input')->get('page'))
        );

        $html = ob_get_clean();

        echo $html;
    }

    // 获取单页数据
    private function _get_page($id, $dir, $page) {

        !$id && !$dir && exit($this->goto_404_page(dr_lang('自定义页面参数不完整，id与dir必须有一个')));

        // 单页缓存
        $cache = $this->get_cache('page-'.SITE_ID);

        // 获取单页ID
        $id = !$id && $dir ? $cache['dir'][$dir] : $id;

        // 无法通过目录找到栏目时，尝试多及目录
        if (!$id && $dir && $cache['data']) {
            foreach ($cache['data'] as $t) {
                if ($t['urlrule']) {
                    $rule = \Phpcmf\Service::L('cache')->get('urlrule', $t['urlrule']);
                    if ($rule['value']['catjoin'] && strpos($dir, $rule['value']['catjoin'])) {
                        $dir = trim(strchr($dir, $rule['value']['catjoin']), $rule['value']['catjoin']);
                        if (isset($cache['dir'][$dir])) {
                            $id = $cache['dir'][$dir];
                            break;
                        }
                    }
                }
            }
        }

        // 当前单页的数据
        $data = $cache['data'][$id];
        !$data && exit($this->goto_404_page(dr_lang('自定义页面（%s）不存在', $id)));

        // 无权限访问单页
        if (!dr_member_auth($this->member_authid, $this->member_cache['auth_site'][SITE_ID]['page'][$id]['show'])) {
            $this->_msg(0, dr_lang('您的用户组无权限访问自定义页面'));
            return;
        }

        // 单页验证是否存在子栏目，是否将下级第一个单页作为当前页
        if ($data['child'] && $data['setting']['getchild']) {
            $temp = explode(',', $data['childids']);
            if ($temp) {
                foreach ($temp as $i) {
                    if ($cache['data'][$i]['id'] != $id && $cache['data'][$i]['show'] && !$cache['data'][$i]['child']) {
                        $id = $i;
                        $data = $cache['data'][$i];
                        break;
                    }
                }
            }
        }

        // 格式化字段
        $data = \Phpcmf\Service::L('field')->format_value( \Phpcmf\Service::L('cache')->get('page-'.SITE_ID.'-field'), $data, $page);

        $title = $data['setting']['title'] ? $data['setting']['title'] : dr_get_page_pname($id, SITE_SEOJOIN, $cache['data']);
        isset($data['content_title']) && $data['content_title'] && $title = $data['content_title'].SITE_SEOJOIN.$title;

        // 栏目下级或者同级栏目
        list($parent, $related) = dr_related_cat($cache['data'], $id);

        // 格式化配置
        $data['setting'] = dr_string2array($data['setting']);

        \Phpcmf\Service::V()->assign($data);
        \Phpcmf\Service::V()->assign([
            'top' => $data['topid'] ? $cache['data'][$data['topid']] : $data,
            'pageid' => $id,
            'parent' => $parent,
            'related' => $related,
            'urlrule' => \Phpcmf\Service::L('Router')->page_url($data, '{page}'),
            'meta_title' => $title,
            'meta_keywords' => $data['setting']['keywords'] ? $data['setting']['keywords'] : ($data['pid'] ? $cache['data'][$data['pid']]['setting']['keywords'] : ''),
            'meta_description' => $data['setting']['description'] ? $data['setting']['description'] : ($data['pid'] ? $cache['data'][$data['pid']]['setting']['description'] : ''),
            'fix_html_now_url' => defined('SC_HTML_FILE') ? dr_url_prefix(\Phpcmf\Service::L('Router')->page_url($data, $page), null, SITE_ID, \Phpcmf\Service::V()->_is_mobile == 'mobile') : '', // 修复静态下的当前url变量
        ]);
        \Phpcmf\Service::V()->display($data['setting']['template'] ? $data['setting']['template'] : 'page.html');

        return $data;
    }

    // 生成单页
    public function htmlfile() {

        // 判断权限
        !dr_html_auth() && $this->_json(0, '权限验证超时，请重新执行生成');
        $this->member_cache['auth_site'][SITE_ID]['home'] && $this->_json(0, '当前网站设置了访问权限，无法生成静态');

        $page = max(1, intval($_GET['pp']));
        $name = 'page-html-file';
        $cache = \Phpcmf\Service::L('cache')->init()->get($name);
        !$cache && $this->_json(0, '临时缓存数据缓存不存在');

        $data = $cache[$page];
        if ($data) {
            $html = '';
            foreach ($data as $t) {
                $class = '';
                if ($t['setting']['linkurl']) {
                    $ok = "<span class='error'>外链".$t['setting']['linkurl']."不能生成</span>";
                    $class = ' p_error';
                } elseif (!$t['setting']['html']) {
                    $ok = "<span class='error'>它是动态模式</span>";
                    $class = ' p_error';
                } elseif ($this->member_cache['auth_site'][SITE_ID]['page'][$t['id']]['show']) {
                    $ok = "<span class='error'>设置的有访问权限</span>";
                    $class = ' p_error';
                } else {
                    $rt = $this->_create_html_file($t['id']);
                    if ($rt['code']) {
                        $ok = "<a class='ok' href='".$t['url']."' target='_blank'>生成成功</a>";
                    } else {
                        $ok = "<span class='error'>".$rt['msg']."</span>";
                        $class = ' p_error';
                    }

                }
                $html.= '<p class="'.$class.'"><label class="rleft">'.$t['name'].'</label><label class="rright">'.$ok.'</label></p>';

            }
            $this->_json($page + 1, $html);
        }

        // 完成
        \Phpcmf\Service::L('cache')->clear($name);
        $this->_json(100, '');
    }

    // 生成单页
    private function _create_html_file($id, $page = 0) {

        // 标识变量
        !defined('SC_HTML_FILE') && define('SC_HTML_FILE', 1);

        // 开启ob函数
        ob_start();
        \Phpcmf\Service::V()->init('pc');
        $data = $this->_get_page($id, '', 0);
        $html = ob_get_clean();

        // 获取生成html的文件名
        $url = $page > 0 ?\Phpcmf\Service::L('Router')->page_url($data, $page) : $data['url'];
        $root = !$data['setting']['html_dir'] ? \Phpcmf\Service::L('html')->get_webpath(SITE_ID, 'site') : dr_get_dir_path($data['setting']['html_dir']);
        $doamin = '';
        if ($data['setting']['html_domain']) {
            $doamin = strpos($data['setting']['html_domain'], 'http') === 0 ? $data['setting']['html_domain'] : dr_http_prefix($data['setting']['html_domain']);
        }

        $ourl = \Phpcmf\Service::L('Router')->remove_domain($url, $doamin);
        $file = dr_to_html_file($ourl, $root);
        if (!$file) {
            return dr_return_data(0, '此URL【'.$data['url'].'】无法生成');
        } else {
            // 判断是否生成成功
            // pc端
            $size = file_put_contents($file, $html, LOCK_EX);
            if (!$size) {
                return dr_return_data(0, '无权限写入文件【'.$file.'】');
            }
            // 移动端生成
            if (SITE_IS_MOBILE_HTML) {
                ob_start();
                \Phpcmf\Service::V()->init('mobile');
                $data = $this->_get_page($id, '', 0);
                $html = ob_get_clean();
                $file = dr_to_html_file($ourl, $root.'mobile/');
                $size = file_put_contents($file, $html, LOCK_EX);
                if (!$size) {
                    return dr_return_data(0, '无权限写入文件【'.$file.'】');
                }
            }
        }

        if ($page == 0 && $data['content_page']) {
            foreach ($data['content_page'] as $i => $t) {
                // 生成页面
                $this->_create_html_file($id, $i);
            }
        }

        return dr_return_data(1, 'ok');
    }

}
