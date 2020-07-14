<header>
    <div class="headerweb clearfix" >
        <div style="display: inline-block;">
            <img alt="广州市花木公司" src="<?php echo HOME_THEME_PATH; ?>picture/gzhm.png">
        </div>
        <div class="header-nav commonweb " style="display: inline-block;">
            <ul class="clearfix" id="curlist">
            <li rel="0" <?php if ($indexc) { ?>class='cur'<?php } ?>>
              <h3><a href="<?php echo SITE_URL; ?>" title="<?php echo SITE_TITLE; ?>">网站首页</a><em class="phsearchicon"></em></h3>
            </li>

            <?php $list_return = $this->list_tag("action=category module=share pid=0"); if ($list_return) extract($list_return, EXTR_OVERWRITE); $count=dr_count($return); if (is_array($return)) { foreach ($return as $key=>$t) { $is_first=$key==0 ? 1 : 0;$is_last=$count==$key+1 ? 1 : 0; ?>
            <li rel="<?php echo $key +1; ?>" <?php if (IS_SHARE && $catid && in_array($catid, $t['catids'])) { ?>class='cur'<?php } ?>>
                <h3>
                    <a href="<?php echo $t['url']; ?>" title="<?php echo $t['name']; ?>"><?php echo $t['name']; ?></a>
                    <?php if ($t['child']) { ?><em class="phsearchicon"></em><?php } ?>
                </h3>
                <?php if ($t['child']) { ?>
                <div class='sub-nav'> 
                    <?php $list_return_t2 = $this->list_tag("action=category module=share pid=$t[id]  return=t2"); if ($list_return_t2) extract($list_return_t2, EXTR_OVERWRITE); $count_t2=dr_count($return_t2); if (is_array($return_t2)) { foreach ($return_t2 as $key_t2=>$t2) {  $is_first=$key_t2==0 ? 1 : 0;$is_last=$count_t2==$key_t2+1 ? 1 : 0; ?>
                    <div class="sub-item">
                        <h4><a href="<?php echo $t2['url']; ?>" title="<?php echo $t2['name']; ?>"><?php echo $t2['name']; ?></a></h4>
                    </div>
                    <?php } } ?>
                </div>
                <?php } ?>
            </li>
            <?php } } ?>
            <div class="childMenu"> </div>
        </div>
        <div class="header-right">
            <div class="headsearch"> 
                <a href="javascript:;" class="search-con"> <span class="search-inco"></span>
                    <div class="searchbox">
                        <form  name="formsearch" action="/index.php" method="get">
                            <input type="hidden" name="s" value="news">
                            <input type="hidden" name="c" value="search">
                            <input type="text" name="keyword" class="searchtext" />
                            <input type="submit" class="searchbtn" value="搜索" />
                        </form>
                    </div>
                </a> 
            </div>
            <!--div class="headcompany"> 
                <a href="javascript:;" class="Currentlan">旗下公司</a>
                <div class="company-choose"> 
					<?php $list_return_t = $this->list_tag("action=navigator type=1  return=t"); if ($list_return_t) extract($list_return_t, EXTR_OVERWRITE); $count_t=dr_count($return_t); if (is_array($return_t)) { foreach ($return_t as $key_t=>$t) {  $is_first=$key_t==0 ? 1 : 0;$is_last=$count_t==$key_t+1 ? 1 : 0; ?>
					<a href='<?php echo $t['url']; ?>' target='_blank'><?php echo $t['name']; ?></a>
					<?php } } ?> 
                </div>
			</div-->
			<a href="javascript:;" class="mobnav-btn"> <span></span> <span></span> <span></span> </a> 
          <!--div class="headlanguage"> <a href="" target="_blank" class="langbtn"></a> </div-->
        </div>
    <!-- <div class="pcnavmenubtn"> <a href="javascript:;" class="pcnav-btn"> <span></span> <span></span> <span></span> </a> </div>
    </div> -->
</header>
<!--侧边导航-->
<div class="headsideNav"> 
    <a href="javascript:;" class="slide-colse"></a> 
    <a href="#" ><img src="<?php echo SITE_LOGO; ?>" alt="<?php echo SITE_NAME; ?>" /></a>
    <div class="slide-nav"> </div>
</div>