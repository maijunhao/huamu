</div>
</div>
</div>
</div>
<script>
    /* 有人反映会消耗服务器资源导致系统崩溃
    $(function () {
        <?php if (!is_file(WRITEPATH.'config/run_lock.php')) { ?>
        $.ajax({type: "GET",dataType:"json", url: "/index.php?s=api&c=run&is_ajax=1&num=5",
            success: function(json) {
            },
            error: function(HttpRequest, ajaxOptions, thrownError) {
            }
        });
        <?php } ?>
    });*/
    </script>
</body>
</html>