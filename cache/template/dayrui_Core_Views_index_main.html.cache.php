<?php if ($fn_include = $this->_include("header.html")) include($fn_include);  if ($admin['usermenu']) { ?>
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered myportlet ">
            <div class="portlet-title tabbable-line">
                <div class="caption">
                    <i class="fa fa-send"></i>
                    <span class="caption-subject"> <a style="color:#666" href="<?php echo dr_url('api/my'); ?>"><?php echo dr_lang('快速导航'); ?></a> </span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="admin-usermenu">
                    <?php if (is_array($admin['usermenu'])) { $key_t=-1;$count_t=dr_count($admin['usermenu']);foreach ($admin['usermenu'] as $t) { $key_t++; ?>
                    <a class="btn <?php if ($t['color'] && $t['color']!='default') {  echo $t['color'];  } else { ?>btn-default<?php } ?>" <?php if ($t['target']) { ?> target="_blank" <?php } ?> href="<?php echo $t['url']; ?>"> <?php echo $t['name']; ?> </a>
                    <?php } } ?>
                </div>
            </div>
        </div>
    </div>
</div>
<?php }  if ($table_data) { ?>

<div class="row mymain">
    <div class="col-md-3 column sortable" id="3-1">
        <?php if (is_array($table_data)) { $key_tid=-1;$count_tid=dr_count($table_data);foreach ($table_data as $table=>$tid) { $key_tid++;  if ($tid == '3-1') {  $file = \Phpcmf\Service::M('auth')->get_main_table($table);  if ($fn_include = $this->_load("$file")) include($fn_include);  }  } } ?>
    </div>
    <div class="col-md-3 column sortable" id="3-2">
        <?php if (is_array($table_data)) { $key_tid=-1;$count_tid=dr_count($table_data);foreach ($table_data as $table=>$tid) { $key_tid++;  if ($tid == '3-2') {  $file = \Phpcmf\Service::M('auth')->get_main_table($table);  if ($fn_include = $this->_load("$file")) include($fn_include);  }  } } ?>
    </div>
    <div class="col-md-3 column sortable" id="3-3">
        <?php if (is_array($table_data)) { $key_tid=-1;$count_tid=dr_count($table_data);foreach ($table_data as $table=>$tid) { $key_tid++;  if ($tid == '3-3') {  $file = \Phpcmf\Service::M('auth')->get_main_table($table);  if ($fn_include = $this->_load("$file")) include($fn_include);  }  } } ?>
    </div>
    <div class="col-md-3 column sortable" id="3-4">
        <?php if (is_array($table_data)) { $key_tid=-1;$count_tid=dr_count($table_data);foreach ($table_data as $table=>$tid) { $key_tid++;  if ($tid == '3-4') {  $file = \Phpcmf\Service::M('auth')->get_main_table($table);  if ($fn_include = $this->_load("$file")) include($fn_include);  }  } } ?>
    </div>
</div>
<div class="row mymain">
    <div class="col-md-4 column sortable" id="4-1">
        <?php if (is_array($table_data)) { $key_tid=-1;$count_tid=dr_count($table_data);foreach ($table_data as $table=>$tid) { $key_tid++;  if ($tid == '4-1') {  $file = \Phpcmf\Service::M('auth')->get_main_table($table);  if ($fn_include = $this->_load("$file")) include($fn_include);  }  } } ?>
    </div>

    <div class="col-md-4 column sortable" id="4-2">
        <?php if (is_array($table_data)) { $key_tid=-1;$count_tid=dr_count($table_data);foreach ($table_data as $table=>$tid) { $key_tid++;  if ($tid == '4-2') {  $file = \Phpcmf\Service::M('auth')->get_main_table($table);  if ($fn_include = $this->_load("$file")) include($fn_include);  }  } } ?>
    </div>

    <div class="col-md-4 column sortable" id="4-3">
        <?php if (is_array($table_data)) { $key_tid=-1;$count_tid=dr_count($table_data);foreach ($table_data as $table=>$tid) { $key_tid++;  if ($tid == '4-3') {  $file = \Phpcmf\Service::M('auth')->get_main_table($table);  if ($fn_include = $this->_load("$file")) include($fn_include);  }  } } ?>
    </div>

</div>
<div class="row mymain">
    <div class="col-md-6 column sortable" id="6-1">
        <?php if (is_array($table_data)) { $key_tid=-1;$count_tid=dr_count($table_data);foreach ($table_data as $table=>$tid) { $key_tid++;  if ($tid == '6-1') {  $file = \Phpcmf\Service::M('auth')->get_main_table($table);  if ($fn_include = $this->_load("$file")) include($fn_include);  }  } } ?>
    </div>
    <div class="col-md-6 column sortable" id="6-2">
        <?php if (is_array($table_data)) { $key_tid=-1;$count_tid=dr_count($table_data);foreach ($table_data as $table=>$tid) { $key_tid++;  if ($tid == '6-2') {  $file = \Phpcmf\Service::M('auth')->get_main_table($table);  if ($fn_include = $this->_load("$file")) include($fn_include);  }  } } ?>
    </div>
</div>
<div class="row mymain">
    <div class="col-md-12 column sortable" id="12">
        <?php if (is_array($table_data)) { $key_tid=-1;$count_tid=dr_count($table_data);foreach ($table_data as $table=>$tid) { $key_tid++;  if ($tid == '12') {  $file = \Phpcmf\Service::M('auth')->get_main_table($table);  if ($fn_include = $this->_load("$file")) include($fn_include);  }  } } ?>
    </div>
</div>

<?php }  if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>