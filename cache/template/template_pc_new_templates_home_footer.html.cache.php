<footer class="footer">
    <div style="height: 400px;">
        <div style="height: 400px;e ;width: 1200px; margin: 0 auto;">
            <div style="width: 500px;  border-bottom:  1px dashed#666; display: inline-block; padding: 10px;padding-top: 50px;margin-right: 100px; margin-left: 100px;"><span><h3>联系我们</h3></span></div>
            <div style="width: 350px; border-bottom:  1px dashed#666;display: inline-block; padding: 10px;padding-top: 50px;"><span><h3>友情连接</h3></span></div>
            <div style="width: 500px; height: 280px; margin-left: 50px; padding-top: 20px; ">
                <div style="height: 150px; width: 150px; background-color: black; display: inline-block;padding-top: 50px;margin-right: 60px; margin-left: 100px;"></div>
                <div style="height: 150px; width: 185px;  display: inline-block; ">
                    <ul>
                        <li style="margin: 15px;"><span>地址：广州十水荫路102号</span></li>
                        <li style="margin: 15px;"> <span>电话：020-37598508</span></li>
                        <li style="margin: 15px;"> <span>传真：020-37598885</span></li>
                        <li style="margin: 15px;"><span>E-mail：hmgs1958@21cn.com</span></li>
                        
                    </ul>
                </div>
            </div>



            <div class="footer-top commonweb clearfix" style="padding: 0px;padding-left: 150px;" >
                <ul class="clearfix">
                    <?php $list_return = $this->list_tag("action=category module=share pid=0"); if ($list_return) extract($list_return, EXTR_OVERWRITE); $count=dr_count($return); if (is_array($return)) { foreach ($return as $key=>$t) { $is_first=$key==0 ? 1 : 0;$is_last=$count==$key+1 ? 1 : 0; ?>
                    <li class="li1" style="padding-right:  10px;">
                        <h3><a href="<?php echo $t['url']; ?>" title="<?php echo $t['name']; ?>"><?php echo $t['name']; ?></a>   <span>&nbsp&nbsp|</span>  </h3>
                    </li>
                    <?php } } ?>
                </ul>
            </div>
        </div>

    </div>







 
    <div style="height: 40px;background-color:dimgray;">
            <div style="display: inline-block;margin-left: 400px;margin-top: 5px;"><img src="static\new\images\CgAGfFpDdVuADs4FAABLOOn9ZJA677.png" alt="static\new\images\CgAGfFpDdVuADs4FAABLOOn9ZJA677.png" style="margin-top: 8px;"></div>
            <div style="display: inline-block;"><p>粤公网安备 44010402001072号</p></div>
            <div style="display: inline-block;margin-left: 400px;"><p>Copyright ©2005 - 2017 广州市花木公司</p></div>
            <div style="display: inline-block;margin-left: 10px;"><p>粤ICP备17123259号</p></div>
            <div style="display: inline-block;margin-left: 10px;"><p>网站地图</p></div>
            <div style="display: inline-block;margin-left: 10px;"><p>犀牛云提供企业云服务</p></div>
    </div>

</footer>
<script type="text/javascript" src="<?php echo HOME_THEME_PATH; ?>js/scrollbar.js"></script> 
<script type="text/javascript" src="<?php echo HOME_THEME_PATH; ?>js/jquery.countup.min.js"></script> 
<script type="text/javascript" src="<?php echo HOME_THEME_PATH; ?>js/swiper.jquery.min.js"></script> 
<script type="text/javascript" src="<?php echo HOME_THEME_PATH; ?>js/wow.min.js"></script> 
<script>
    var wow = new WOW({
        boxClass: 'wow',
        animateClass: 'animated',
        offset: 0,
        mobile: true,
        live: true
    });
    wow.init();
</script> 
<script src="<?php echo HOME_THEME_PATH; ?>js/layout.js"></script>
