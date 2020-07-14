<div class="full-inside-subnav">
  <div class="commonweb clearfix">
    <div class="inside-subnav">
      <h3 class="channel-title"><?php echo $top['name']; ?></h3>
      <div class="subnav clearfix">
        <ul class="clearfix">
            <?php if (is_array($related)) { $key_c=-1;$count_c=dr_count($related);foreach ($related as $c) { $key_c++; ?>
                <li <?php if ($c['id']==$catid) { ?>class='cur'<?php } ?>><a href='<?php echo $c['url']; ?>'><?php echo $c['name']; ?></a></li>
            <?php } } ?>
        </ul>
        <a href="javascript:;" class="sub-btn sub-prev"></a> <a href="javascript:;" class="sub-btn sub-next"></a> </div>
    </div>
    <div class="crumb">
      <div class="inner"> 
        <a href="<?php echo SITE_URL; ?>" class="home"></a> <a href='<?php echo SITE_URL; ?>'>主页</a> > <?php echo dr_catpos($catid, '', true, '<a href="[url]">[name]</a>'); ?> </div>
    </div>
  </div>
</div>