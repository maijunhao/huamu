<?php if ($fn_include = $this->_include("top.html")) include($fn_include);  if ($fn_include = $this->_include("header.html")) include($fn_include);  if ($fn_include = $this->_include("background.html")) include($fn_include); ?>
<!-- <?php if ($fn_include = $this->_include("nav.html")) include($fn_include); ?> -->
<?php if ($fn_include = $this->_include("cat.html")) include($fn_include); ?>

<div class="newscenter-list commonweb">
    <ul class="clearfix">
    <!--图片尺寸378*278--> 
    <?php $list_return = $this->list_tag("action=module catid=$catid order=updatetime page=1"); if ($list_return) extract($list_return, EXTR_OVERWRITE); $count=dr_count($return); if (is_array($return)) { foreach ($return as $key=>$t) { $is_first=$key==0 ? 1 : 0;$is_last=$count==$key+1 ? 1 : 0; ?>
    <li class="col-sm-4"> 
        <a href="<?php echo $t['url']; ?>" title="<?php echo $t['title']; ?>">
            <p class="news-img"> <img  src="<?php echo dr_thumb($t['thumb'], 378, 278); ?>" alt="<?php echo $t['title']; ?>" /> </p>
            <div class="news-text">
                <h3 class="name"><?php echo $t['title']; ?></h3>
                <p class="desc"><?php echo $t['description']; ?></p>
                <span class="date"><?php echo $t['updatetime']; ?></span> 
            </div>
        </a> 
    </li>
    <?php } } ?>
    <?php if (!$count) { ?>
        <p>没有找到相关内容...</p>
    <?php } ?>
    </ul>
</div>
<div class="commonweb padtbb">
  <div class="pages">
    <?php echo $pages; ?>
  </div>
</div>
<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>