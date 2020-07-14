<?php if ($fn_include = $this->_include("top.html")) include($fn_include);  if ($fn_include = $this->_include("header.html")) include($fn_include);  if ($fn_include = $this->_include("background.html")) include($fn_include); ?>
<!-- <?php if ($fn_include = $this->_include("nav.html")) include($fn_include); ?> -->
<?php if ($fn_include = $this->_include("cat.html")) include($fn_include); ?>
<div class="Pledge-min commonweb padtb" >
    <div class="Pledetext">
        <?php echo $cat['content']; ?>
    </div>
</div>
<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>
</body>
</html>