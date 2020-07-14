<?php if ($fn_include = $this->_include("top.html")) include($fn_include);  if ($fn_include = $this->_include("header.html")) include($fn_include); ?>
<a href="javascript:;" class="exit-off-canvas"></a>
<!-- 轮播图   s-->
<div >
  <div class="indexbanner swiper-container" >
    <ul class="swiper-wrapper clearfix">
      <li class="swiper-slide"> 
        <a href="#"> <img class="img" src="<?php echo HOME_THEME_PATH; ?>picture/1-1.jpg" mobile-img="<?php echo HOME_THEME_PATH; ?>picture/1-1.jpg" pc-img="<?php echo HOME_THEME_PATH; ?>picture/1-1.jpg" alt="幻灯一"/></a> 
      </li>
      <li class="swiper-slide">
        <a href="#"> <img class="img" src="<?php echo HOME_THEME_PATH; ?>picture/1-2.jpg" mobile-img="<?php echo HOME_THEME_PATH; ?>picture/1-2.jpg" pc-img="<?php echo HOME_THEME_PATH; ?>picture/1-2.jpg" alt="幻灯二"/></a> 
      </li>
      <li class="swiper-slide"> 
        <a href="#"> <img class="img" src="<?php echo HOME_THEME_PATH; ?>picture/1-3.jpg" mobile-img="<?php echo HOME_THEME_PATH; ?>picture/1-3.jpg" pc-img="<?php echo HOME_THEME_PATH; ?>picture/1-3.jpg" alt="幻灯三"/></a> 
      </li>
      <li class="swiper-slide"> 
        <a href="#"> <img class="img" src="<?php echo HOME_THEME_PATH; ?>picture/1-4.jpg" mobile-img="<?php echo HOME_THEME_PATH; ?>picture/1-4.jpg" pc-img="<?php echo HOME_THEME_PATH; ?>picture/1-4.jpg" alt="幻灯三"/></a> 
      </li>
    </ul>
    <div class="ipages commonweb"></div>
  </div>
  <!-- 轮播图  end -->
  <!-- 关于我们  s -->
  <div class="indxNewsmin commonweb padtb" >
      <div class="index-text center wow fadeInDown">
          <h2 class="cn font30 "><?php echo dr_share_cat_value(41, 'name'); ?></h2>
          <h3 class="en font24 "><?php echo dr_share_cat_value(41, 'eng_name'); ?></h3>
      </div>
  <!-- 关于我们  end -->
  <!-- 两边图  s -->
  </div>
  <div class="indxAboutus clearfix" >
      <div class="par-posimg wow fadeInLeft" 
      style="background: url(./static/huamu_img/wmtx_yllhyh/1111.jpg) no-repeat  center  ;background-size: cover;width: 750px;height: 400px; margin-right: 150px; border-radius: 20px;">
                                   
      </div>
      <div style="padding-top: 30px; width: 1500px;">
      <div class="par-content wow fadeInRight" style="background-color:lightblue; padding: 15px; height: 340px; width: 900px;" >
          <div style="padding-left: 80px;"><h2 class="font34 cd82019"><?php echo dr_share_cat_value(48, 'eng_name'); ?></h2>
          <?php echo dr_strcut(dr_clearhtml(dr_share_cat_value(48, 'content')), 200); ?>
          <p class="visible-lg"> </p>
          <div class="index-more wow fadeInUp">
            <a href="<?php echo dr_share_cat_value(48, 'url'); ?>">了解更多</a>
          </div>
           </div>
      </div>
    </div>
  </div>
 
  <!-- 两边图  end -->
  <!-- "党务公开"  s -->
  <div class="indxNewsmin commonweb padtb">
    <div class="index-text center wow fadeInDown">
        <h2 class="cn font30 "><?php echo dr_share_cat_value(42, 'name'); ?></h2>
        <h3 class="en font24 "><?php echo dr_share_cat_value(42, 'eng_name'); ?></h3>
    </div>
  <!-- "党务公开" end -->
 
  <!---"党务公开"  s -->
    <div class="indxNews-wraper "> 
          <div class="inxnews-list">
              <ul class="clearfix swiper-wrapper" >
                <?php $list_return = $this->list_tag("action=category module=share pid=42"); if ($list_return) extract($list_return, EXTR_OVERWRITE); $count=dr_count($return); if (is_array($return)) { foreach ($return as $key=>$t) { $is_first=$key==0 ? 1 : 0;$is_last=$count==$key+1 ? 1 : 0; ?>
                
                <li class="swiper-slide wow"> 
                    <a href="<?php echo $t['url']; ?>">
                        <p class="solut-img"> <img src="<?php echo dr_thumb($t['thumb'],300,200); ?>" alt="<?php echo $t['name']; ?>" style="border-radius: 10px;"> </p>
                        <div class="solut-text" style="text-align: center; height: 100px; " >
                            <h1 class="cn font20"><?php echo $t['name']; ?></h1>
                            <button class="btn btn-default btn-lg active" style="width:100px;height:25px;border-radius:15px;margin: 5px auto; border: 1px solid;"> 点击查看 </button>                      
                          </div>
                    </a> 
                </li>
                <?php } } ?>
              </ul>
          </div>
      </div>
    </div>
  <!-- "党务公开"  end -->
  <!--百花飘香  s -->

  <div class="indxProduct commonweb padtb" >
      <div class="index-text center wow fadeInDown">
          <h2 class="cn font30 "><?php echo dr_share_cat_value(43, 'name'); ?></h2>
          <h3 class="en font24 "><?php echo dr_share_cat_value(43, 'eng_name'); ?></h3>
      </div>
      <div style="background-color: whitesmoke;">
  <div class="indxNews-wraper" > 
    <div class="inxnews-list">
        <ul class="clearfix swiper-wrapper">
            <?php $list_return = $this->list_tag("action=module module=photo catid=43 order=updatetime num=3"); if ($list_return) extract($list_return, EXTR_OVERWRITE); $count=dr_count($return); if (is_array($return)) { foreach ($return as $key=>$t) { $is_first=$key==0 ? 1 : 0;$is_last=$count==$key+1 ? 1 : 0; ?>
            <li class="swiper-slide wow" style="border: 1px solid black; margin-left: 80px;"> 
              <a href="<?php echo $t['url']; ?>" title="<?php echo $t['title']; ?>">
              <p class="tiothumb" > <img src="<?php echo dr_thumb($t['thumb'],300,400); ?>" alt="<?php echo $t['title']; ?>"/> </p>
              </a>
            </li>
            <?php } } ?>
        </ul>
    </div>

  </div>
  </div>
</div>

  
  <!-- 百花飘香  end -->
  <!-- 万木吐秀  s -->
  <div class="indxProduct commonweb padtb">
    <div class="index-text center wow fadeInDown">
        <h2 class="cn font30 "><?php echo dr_share_cat_value(44, 'name'); ?></h2>
        <h3 class="en font24 "><?php echo dr_share_cat_value(44, 'eng_name'); ?></h3>
    </div>

  <div class="indxNews-wraper "  > 
  <div class="inxnews-list">
      <ul class="clearfix swiper-wrapper">
          <?php $list_return = $this->list_tag("action=module module=photo catid=44 order=updatetime num=4"); if ($list_return) extract($list_return, EXTR_OVERWRITE); $count=dr_count($return); if (is_array($return)) { foreach ($return as $key=>$t) { $is_first=$key==0 ? 1 : 0;$is_last=$count==$key+1 ? 1 : 0; ?>
          <li class="swiper-slide wow"> 
            <a href="<?php echo $t['url']; ?>" title="<?php echo $t['title']; ?>">
            <p class="tiothumb"> <img src="<?php echo dr_thumb($t['thumb'],300,400); ?>" alt="<?php echo $t['title']; ?>"/> </p>
            </a>
          </li>
          <?php } } ?>
      </ul>
  </div>
  </div>
</div>
  <!-- 万木吐秀  end -->
 
  <!-- 新闻动态  s -->

  <div class=" inxSolution  padtb" style="background: url(<?php echo HOME_THEME_PATH; ?>images/jj.jpg) no-repeat center ;background-size: cover; "  >
    <div class="commonweb" >
      <div class="index-text center wow fadeInDown">
        <h2 class="cn font30 cffffff"><?php echo dr_share_cat_value(45, 'name'); ?></h2>
        <h3 class="en font24 "><?php echo dr_share_cat_value(45, 'eng_name'); ?></h3>
      </div>
      <div class="inxSolut-wrapper">
        <div class=" inxSolut-min" >
          <ul class="clearfix swiper-wrapper">
            <?php $list_return = $this->list_tag("action=module module=news catid=45 order=updatetime num=4"); if ($list_return) extract($list_return, EXTR_OVERWRITE); $count=dr_count($return); if (is_array($return)) { foreach ($return as $key=>$t) { $is_first=$key==0 ? 1 : 0;$is_last=$count==$key+1 ? 1 : 0; ?>
            
              <li class="swiper-slide wow"> 
                  <a href="<?php echo $t['url']; ?>">
                      <p class="solut-img"> <img src="<?php echo dr_thumb($t['thumb']); ?>" alt="<?php echo $t['name']; ?>"/> </p>
                      <div class="" style="background-color: white; height: 150px; text-align: center; padding: 30px;" >
                        <p class="text"  style=" white-space:nowrap;overflow:hidden; text-overflow:ellipsis;width: 150px;font-size: 18px; font-weight: 800;color: black;"><?php echo $t['title']; ?> </p>
                        <p class="text"   >
                           <?php echo $t['title']; ?> 
                           
                          </p>
                      </div>
                  </a> 
              </li>
        
              <?php } } ?>
          </ul>
        </div>
        <!-- <a href="javascript:;" class="index-btn index-prev"></a> <a href="javascript:;" class="index-btn index-next"></a> </div> -->
    </div>
  </div>



</div>


<!-- 新闻动态  end -->
<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>