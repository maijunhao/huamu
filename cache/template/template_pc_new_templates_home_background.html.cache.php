<a href="javascript:;" class="exit-off-canvas"></a>
<div class="inside-banner "> 
<?php if ($cat['thumb']) { ?>
	<!-- <img src="<?php echo dr_get_file($cat['thumb']); ?>" alt="<?php echo $cat['name']; ?>" title="<?php echo $cat['name']; ?>"/> 	 -->
<?php } else if ($cat['mid'] == '') { ?> <!--单页-->
	<!-- <img src="<?php echo dr_get_file(dr_block('page_pic')); ?>" alt="<?php echo $cat['name']; ?>" title="<?php echo $cat['name']; ?>"/>  -->
<?php } else if ($cat['mid'] == 'news') { ?> <!--新闻-->
	<!-- <img src="<?php echo dr_get_file(dr_block('news_pic')); ?>" alt="<?php echo $cat['name']; ?>" title="<?php echo $cat['name']; ?>"/>  -->
<?php } else if ($cat['mid'] == 'photo') { ?> <!--图片-->
	<!-- <img src="<?php echo dr_get_file(dr_block('photo_pic')); ?>" alt="<?php echo $cat['name']; ?>" title="<?php echo $cat['name']; ?>"/>  -->
<?php } else if ($cat['mid'] == 'down') { ?> <!--下载-->
	<!-- <img src="<?php echo dr_get_file(dr_block('down_pic')); ?>" alt="<?php echo $cat['name']; ?>" title="<?php echo $cat['name']; ?>"/>  -->
<?php } else if ($cat['mid'] == 'question') { ?> <!--常见问题-->
	<!-- <img src="<?php echo dr_get_file(dr_block('question_pic')); ?>" alt="<?php echo $cat['name']; ?>" title="<?php echo $cat['name']; ?>"/>  -->
<?php } else if ($cat['mid'] == 'join') { ?> <!--人才招聘-->
	<!-- <img src="<?php echo dr_get_file(dr_block('join_pic')); ?>" alt="<?php echo $cat['name']; ?>" title="<?php echo $cat['name']; ?>"/>  -->
<?php } ?>
</div>