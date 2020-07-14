<!DOCTYPE html>
<!--[if IE 8]> <html lang="zh-cn" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh-cn" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh-cn">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <title>广州市花木公司</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <link href="<?php echo THEME_PATH; ?>assets/global/css/xunruicms.css?v=<?php echo CMF_UPDATE_TIME; ?>" rel="stylesheet" type="text/css" />
    <?php if ($is_min) { ?>
    <link href="<?php echo THEME_PATH; ?>assets/global/css/min.css?v=<?php echo CMF_UPDATE_TIME; ?>" rel="stylesheet" type="text/css" />
    <?php } ?>
    <link href="<?php echo THEME_PATH; ?>assets/global/css/my.css?v=<?php echo CMF_UPDATE_TIME; ?>" rel="stylesheet" type="text/css" />
    <link href="<?php echo THEME_PATH; ?>assets/font-awesome/css/font-awesome.css?v=<?php echo CMF_UPDATE_TIME; ?>" rel="stylesheet" type="text/css" />
    <!--[if lt IE 9]>
    <script src="<?php echo THEME_PATH; ?>assets/global/plugins/respond.min.js"></script>
    <script src="<?php echo THEME_PATH; ?>assets/global/plugins/excanvas.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var admin_file = '<?php echo SELF; ?>';
        var is_min = '<?php echo $is_min; ?>';
        var is_oemcms = '<?php echo IS_OEM_CMS; ?>';
        var is_mobile_cms = '<?php echo $is_mobile; ?>';
        var is_admin = 1;
    </script>
    <script src="<?php echo LANG_PATH; ?>lang.js?v=<?php echo CMF_UPDATE_TIME; ?>" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>assets/global/plugins/jquery.min.js?v=<?php echo CMF_UPDATE_TIME; ?>" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>assets/global/plugins/bootstrap/js/bootstrap.min.js?v=<?php echo CMF_UPDATE_TIME; ?>" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>assets/global/scripts/app.min.js?v=<?php echo CMF_UPDATE_TIME; ?>" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>assets/js/cms.js?v=<?php echo CMF_UPDATE_TIME; ?>" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>assets/global/plugins/js.cookie.min.js?v=<?php echo CMF_UPDATE_TIME; ?>" type="text/javascript"></script>
    <script type="text/javascript">
        function dr_update_cache_all() {
            var index = layer.load(2, {
                shade: [0.3,'#fff'], //0.1透明度的白色背景
                time: 10000
            });
            $.ajax({type: "GET",dataType:"json", url: admin_file+"?c=api&m=cache_update",
                success: function(json) {
                    layer.close(index);
                    dr_tips(1, "<?php echo dr_lang('全站缓存更新完成'); ?>");
                },
                error: function(HttpRequest, ajaxOptions, thrownError) {
                    layer.closeAll('loading');
                    dr_tips(0, "<?php echo dr_lang('更新失败，请检查错误日志'); ?>");
                }
            });
        }
        function dr_update_cache_data() {
            var index = layer.load(2, {
                shade: [0.3,'#fff'], //0.1透明度的白色背景
                time: 10000
            });
            $.ajax({type: "GET",dataType:"json", url: admin_file+"?c=api&m=cache_clear",
                success: function(json) {
                    layer.close(index);
                    dr_tips(1, "<?php echo dr_lang('前端数据缓存更新完成'); ?>");
                },
                error: function(HttpRequest, ajaxOptions, thrownError) {
                    layer.closeAll('loading');
                    dr_tips(0, "<?php echo dr_lang('更新失败，请检查错误日志'); ?>");
                }
            });
        }
        function show_category_field(catid) {
            <?php if ($category_field_url) { ?>
            window.location.href = '<?php echo $category_field_url; ?>&catid='+catid;
            <?php } ?>
        }

        <?php if ($is_index) { ?>

            // 退出
            function dr_logout(url) {
                var r=confirm(lang['logout']);
                if (r==true) {
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        url: url,
                        success: function(json) {
                            if (json.code == 1) {
                                setTimeout("window.location.href='<?php echo dr_url("login/index"); ?>'", 1000);
                            }
                            dr_tips(json.code, json.msg);
                        },
                        error: function(HttpRequest, ajaxOptions, thrownError) {
                            dr_ajax_alert_error(HttpRequest, ajaxOptions, thrownError)
                        }
                    });
                }
            }
            function dr_select_site(id) {
                var r=confirm('<?php echo dr_lang("你确定要切换到选中站点吗？"); ?>')
                if (r==true) {
                    window.location.href='<?php echo dr_url("sites/api/login_select"); ?>&id='+id
                }
            }

            function Mlink(top, left, link, url) {

                // 延迟提示
                /*
                var admin_loading = layer.load(2, {
                    time: 1000
                });*/

                <?php if ($is_min) {  if ($is_mobile) { ?>$('.page-header .responsive-toggler').click();<?php } ?>
                $(".nav-item").removeClass("active open");
                    var admin_loading = layer.load(2, {
                        time: 1000
                    });
                <?php } else { ?>
                $('.dr_menu_item').hide();
                $('.dr_menu_'+top).show();
                $('.dr_menu_'+top+' .sub-menu').hide();

                $('#dr_m_top_'+top+' li').removeClass('active open');
                $('.dr_menu_'+top+' li').removeClass('active open');
                <?php } ?>

                $('#dr_menu_link_'+link).addClass('active open');
                $('#dr_menu_m_link_'+link).addClass('active open');

                // 顶级菜单选择
                $('.top-menu .navbar-nav li').removeClass('open');
                $('.dr_mini_menu_top').removeClass('open');
                $('#dr_menu_top_'+top).addClass('open');
                $('#dr_mini_menu_top_'+top).addClass('open');

                // 移动端选择
                $('.fc-mb-sum-menu').hide();
                $('#dr_m_top_'+top).show();

                // 分组菜单选择
                $('.dr_menu_'+top+'').removeClass('active open');
                $('.dr_menu_'+top+' .selected').hide();
                $('.dr_menu_'+top+' .arrow').removeClass('open');


                $('#dr_menu_left_'+left).addClass('active open');
                $('#dr_menu_left_'+left+' .selected').show();
                $('#dr_menu_left_'+left+' .arrow').addClass('open');
                $('#dr_menu_left_'+left+' .sub-menu').show();

                $("#right_page").attr('src', url);
                $("#right_page").attr("url", url);

            }
            function wSize(){
                var str=getWindowSize();
                var strs= new Array(); //定义一数组
                strs=str.toString().split(","); //字符分割
                var heights = strs[0]-70,Body = $('body');
                $('#right_page').height(heights);
            }
            if(!Array.prototype.map)
                Array.prototype.map = function(fn,scope) {
                    var result = [],ri = 0;
                    for (var i = 0,n = this.length; i < n; i++){
                        if(i in this){
                            result[ri++]  = fn.call(scope ,this[i],i,this);
                        }
                    }
                    return result;
                };

            var getWindowSize = function(){
                return ["Height","Width"].map(function(name){
                    return window["inner"+name] ||
                        document.compatMode === "CSS1Compat" && document.documentElement[ "client" + name ] || document.body[ "client" + name ]
                });
            }

            $(function(){
                window.onresize=wSize;
                wSize();
                // 宽度小时
                if ($(document).width() < 900) {
                    $('.page-sidebar .sidebar-toggler').click();
                }
            });

        <?php } ?>
    </script>
</head>
