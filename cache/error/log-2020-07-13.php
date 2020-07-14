<?php defined('SYSTEMPATH') || exit('No direct script access allowed'); ?>

ERROR - 2020-07-13 10:04:19 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 10:04:19 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594605858124
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 10:04:19 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 10:04:19 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594605858125
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 10:42:03 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT count(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT count(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT count(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT count(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(723): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(544): Phpcmf\Model->limit_page(10)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Module.php(81): Phpcmf\Table->_List(Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\App\Wmtx\Controllers\Admin\Home.php(11): Phpcmf\Admin\Module->_Admin_List()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Home->index()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Home))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 10:42:03 --> Table 'cms.dr_1_wmtx' doesn't exist
# http://10.50.0.40/admin.php?s=wmtx&c=home&m=index
# SELECT count(*) as total
FROM `dr_1_wmtx`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT count(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT count(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT count(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT count(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(723): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(544): Phpcmf\Model->limit_page(10)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Module.php(81): Phpcmf\Table->_List(Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\App\Wmtx\Controllers\Admin\Home.php(11): Phpcmf\Admin\Module->_Admin_List()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Home->index()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Home))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 10:42:05 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT count(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT count(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT count(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT count(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(723): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(544): Phpcmf\Model->limit_page(10)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Module.php(81): Phpcmf\Table->_List(Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\App\Lxwm\Controllers\Admin\Home.php(11): Phpcmf\Admin\Module->_Admin_List()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Home->index()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Home))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 10:42:05 --> Table 'cms.dr_1_lxwm' doesn't exist
# http://10.50.0.40/admin.php?s=lxwm&c=home&m=index
# SELECT count(*) as total
FROM `dr_1_lxwm`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT count(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT count(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT count(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT count(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(723): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(544): Phpcmf\Model->limit_page(10)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Module.php(81): Phpcmf\Table->_List(Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\App\Lxwm\Controllers\Admin\Home.php(11): Phpcmf\Admin\Module->_Admin_List()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Home->index()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Home))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 10:42:37 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT count(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT count(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT count(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT count(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(723): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(544): Phpcmf\Model->limit_page(10)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Module.php(81): Phpcmf\Table->_List(Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\App\Lxwm\Controllers\Admin\Home.php(11): Phpcmf\Admin\Module->_Admin_List()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Home->index()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Home))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 10:42:37 --> Table 'cms.dr_1_lxwm' doesn't exist
# http://10.50.0.40/admin.php?s=lxwm&c=home&m=index
# SELECT count(*) as total
FROM `dr_1_lxwm`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT count(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT count(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT count(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT count(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(723): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(544): Phpcmf\Model->limit_page(10)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Module.php(81): Phpcmf\Table->_List(Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\App\Lxwm\Controllers\Admin\Home.php(11): Phpcmf\Admin\Module->_Admin_List()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Home->index()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Home))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 10:42:57 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT count(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT count(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT count(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT count(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(723): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(544): Phpcmf\Model->limit_page(10)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Module.php(81): Phpcmf\Table->_List(Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\App\Lxwm\Controllers\Admin\Home.php(11): Phpcmf\Admin\Module->_Admin_List()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Home->index()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Home))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 10:42:57 --> Table 'cms.dr_1_lxwm' doesn't exist
# http://10.50.0.40/admin.php?s=lxwm&c=home&m=index
# SELECT count(*) as total
FROM `dr_1_lxwm`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT count(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT count(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT count(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT count(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(723): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(544): Phpcmf\Model->limit_page(10)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Module.php(81): Phpcmf\Table->_List(Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\App\Lxwm\Controllers\Admin\Home.php(11): Phpcmf\Admin\Module->_Admin_List()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Home->index()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Home))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 10:42:57 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT count(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT count(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT count(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT count(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(723): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(544): Phpcmf\Model->limit_page(10)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Module.php(81): Phpcmf\Table->_List(Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\App\Wmtx\Controllers\Admin\Home.php(11): Phpcmf\Admin\Module->_Admin_List()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Home->index()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Home))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 10:42:57 --> Table 'cms.dr_1_wmtx' doesn't exist
# http://10.50.0.40/admin.php?s=wmtx&c=home&m=index
# SELECT count(*) as total
FROM `dr_1_wmtx`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT count(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT count(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT count(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT count(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(723): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(544): Phpcmf\Model->limit_page(10)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Module.php(81): Phpcmf\Table->_List(Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\App\Wmtx\Controllers\Admin\Home.php(11): Phpcmf\Admin\Module->_Admin_List()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Home->index()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Home))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 10:50:53 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT * FROM `dr_1_photo` WHERE `dr_1_photo`.`catid` IN (44,58,60,61,62) AND `dr_1_photo`.`status` = 9 ORDER BY `dr_1_photo`.`updatetime` DESC LIMIT 4
#0 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\View.php(225): include()
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#7 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#8 {main}
CRITICAL - 2020-07-13 10:51:02 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT * FROM `dr_1_photo` WHERE `dr_1_photo`.`catid` IN (44,58,60,61,62) AND `dr_1_photo`.`status` = 9 ORDER BY `dr_1_photo`.`updatetime` DESC LIMIT 4
#0 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\View.php(225): include()
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#7 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#8 {main}
CRITICAL - 2020-07-13 10:51:03 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT * FROM `dr_1_photo` WHERE `dr_1_photo`.`catid` IN (44,58,60,61,62) AND `dr_1_photo`.`status` = 9 ORDER BY `dr_1_photo`.`updatetime` DESC LIMIT 4
#0 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\View.php(225): include()
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#7 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#8 {main}
CRITICAL - 2020-07-13 10:51:04 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT * FROM `dr_1_photo` WHERE `dr_1_photo`.`catid` IN (44,58,60,61,62) AND `dr_1_photo`.`status` = 9 ORDER BY `dr_1_photo`.`updatetime` DESC LIMIT 4
#0 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\View.php(225): include()
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#7 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#8 {main}
CRITICAL - 2020-07-13 10:51:08 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT * FROM `dr_1_photo` WHERE `dr_1_photo`.`catid` IN (44,58,60,61,62) AND `dr_1_photo`.`status` = 9 ORDER BY `dr_1_photo`.`updatetime` DESC LIMIT 4
#0 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\View.php(225): include()
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#7 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#8 {main}
CRITICAL - 2020-07-13 10:51:09 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT * FROM `dr_1_photo` WHERE `dr_1_photo`.`catid` IN (44,58,60,61,62) AND `dr_1_photo`.`status` = 9 ORDER BY `dr_1_photo`.`updatetime` DESC LIMIT 4
#0 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\View.php(225): include()
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#7 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#8 {main}
CRITICAL - 2020-07-13 10:51:09 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT * FROM `dr_1_photo` WHERE `dr_1_photo`.`catid` IN (44,58,60,61,62) AND `dr_1_photo`.`status` = 9 ORDER BY `dr_1_photo`.`updatetime` DESC LIMIT 4
#0 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\View.php(225): include()
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#7 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#8 {main}
CRITICAL - 2020-07-13 10:51:09 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT * FROM `dr_1_photo` WHERE `dr_1_photo`.`catid` IN (44,58,60,61,62) AND `dr_1_photo`.`status` = 9 ORDER BY `dr_1_photo`.`updatetime` DESC LIMIT 4
#0 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\View.php(225): include()
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#7 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#8 {main}
CRITICAL - 2020-07-13 10:51:09 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT * FROM `dr_1_photo` WHERE `dr_1_photo`.`catid` IN (44,58,60,61,62) AND `dr_1_photo`.`status` = 9 ORDER BY `dr_1_photo`.`updatetime` DESC LIMIT 4
#0 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\View.php(225): include()
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#7 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#8 {main}
CRITICAL - 2020-07-13 10:51:10 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT * FROM `dr_1_photo` WHERE `dr_1_photo`.`catid` IN (44,58,60,61,62) AND `dr_1_photo`.`status` = 9 ORDER BY `dr_1_photo`.`updatetime` DESC LIMIT 4
#0 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\View.php(225): include()
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#7 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#8 {main}
CRITICAL - 2020-07-13 10:51:10 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT * FROM `dr_1_photo` WHERE `dr_1_photo`.`catid` IN (44,58,60,61,62) AND `dr_1_photo`.`status` = 9 ORDER BY `dr_1_photo`.`updatetime` DESC LIMIT 4
#0 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\View.php(225): include()
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#7 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#8 {main}
CRITICAL - 2020-07-13 10:51:11 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT * FROM `dr_1_photo` WHERE `dr_1_photo`.`catid` IN (44,58,60,61,62) AND `dr_1_photo`.`status` = 9 ORDER BY `dr_1_photo`.`updatetime` DESC LIMIT 4
#0 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\View.php(225): include()
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#7 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#8 {main}
CRITICAL - 2020-07-13 11:30:43 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
CRITICAL - 2020-07-13 11:30:50 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
CRITICAL - 2020-07-13 11:30:52 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
CRITICAL - 2020-07-13 11:39:52 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
CRITICAL - 2020-07-13 11:39:56 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
CRITICAL - 2020-07-13 11:40:05 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
CRITICAL - 2020-07-13 11:40:06 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
CRITICAL - 2020-07-13 11:40:47 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
CRITICAL - 2020-07-13 11:41:21 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
CRITICAL - 2020-07-13 11:41:23 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
CRITICAL - 2020-07-13 11:41:23 --> syntax error, unexpected '}', expecting end of file
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
CRITICAL - 2020-07-13 12:00:47 --> syntax error, unexpected '50' (T_LNUMBER), expecting ',' or ';'
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
CRITICAL - 2020-07-13 12:02:18 --> syntax error, unexpected '<'
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#7 {main}
ERROR - 2020-07-13 14:07:05 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SHOW COLUMNS FR...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SHOW COLUMNS FR...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SHOW COLUMNS FR...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1623): CodeIgniter\Database\BaseConnection->query('SHOW COLUMNS FR...')
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Table.php(29): CodeIgniter\Database\BaseConnection->getFieldNames('dr_1_wmtx')
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(65): Phpcmf\Model\Table->cache('1', Array)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(993): Phpcmf\Model\Cache->sync_cache()
#7 [internal function]: Phpcmf\Admin\Category->Phpcmf\Admin\{closure}(41, Array, Array)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(285): call_user_func_array(Object(Closure), Array)
#9 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(994): Phpcmf\Table->_Save(41, Array, Array, Object(Closure), Object(Closure))
#10 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(338): Phpcmf\Admin\Category->_Save(41, Array, Array)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(265): Phpcmf\Table->_Post(41, NULL, 1)
#12 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Category.php(24): Phpcmf\Admin\Category->_Admin_Edit()
#13 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Category->edit()
#14 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Category))
#15 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#16 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#17 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#18 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#19 {main}
CRITICAL - 2020-07-13 14:07:05 --> Table 'cms.dr_1_wmtx' doesn't exist
# http://10.50.0.40/admin.php?c=category&m=edit&id=41
# SHOW COLUMNS FROM `dr_1_wmtx`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SHOW COLUMNS FR...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SHOW COLUMNS FR...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SHOW COLUMNS FR...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1623): CodeIgniter\Database\BaseConnection->query('SHOW COLUMNS FR...')
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Table.php(29): CodeIgniter\Database\BaseConnection->getFieldNames('dr_1_wmtx')
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(65): Phpcmf\Model\Table->cache('1', Array)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(993): Phpcmf\Model\Cache->sync_cache()
#7 [internal function]: Phpcmf\Admin\Category->Phpcmf\Admin\{closure}(41, Array, Array)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(285): call_user_func_array(Object(Closure), Array)
#9 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(994): Phpcmf\Table->_Save(41, Array, Array, Object(Closure), Object(Closure))
#10 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(338): Phpcmf\Admin\Category->_Save(41, Array, Array)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(265): Phpcmf\Table->_Post(41, NULL, 1)
#12 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Category.php(24): Phpcmf\Admin\Category->_Admin_Edit()
#13 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Category->edit()
#14 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Category))
#15 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#16 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#17 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#18 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#19 {main}
ERROR - 2020-07-13 14:07:12 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SHOW COLUMNS FR...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SHOW COLUMNS FR...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SHOW COLUMNS FR...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1623): CodeIgniter\Database\BaseConnection->query('SHOW COLUMNS FR...')
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Table.php(29): CodeIgniter\Database\BaseConnection->getFieldNames('dr_1_wmtx')
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(65): Phpcmf\Model\Table->cache('1', Array)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(993): Phpcmf\Model\Cache->sync_cache()
#7 [internal function]: Phpcmf\Admin\Category->Phpcmf\Admin\{closure}(41, Array, Array)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(285): call_user_func_array(Object(Closure), Array)
#9 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(994): Phpcmf\Table->_Save(41, Array, Array, Object(Closure), Object(Closure))
#10 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(338): Phpcmf\Admin\Category->_Save(41, Array, Array)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(265): Phpcmf\Table->_Post(41, NULL, 1)
#12 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Category.php(24): Phpcmf\Admin\Category->_Admin_Edit()
#13 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Category->edit()
#14 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Category))
#15 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#16 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#17 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#18 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#19 {main}
CRITICAL - 2020-07-13 14:07:12 --> Table 'cms.dr_1_wmtx' doesn't exist
# http://10.50.0.40/admin.php?c=category&m=edit&id=41
# SHOW COLUMNS FROM `dr_1_wmtx`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SHOW COLUMNS FR...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SHOW COLUMNS FR...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SHOW COLUMNS FR...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1623): CodeIgniter\Database\BaseConnection->query('SHOW COLUMNS FR...')
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Table.php(29): CodeIgniter\Database\BaseConnection->getFieldNames('dr_1_wmtx')
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(65): Phpcmf\Model\Table->cache('1', Array)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(993): Phpcmf\Model\Cache->sync_cache()
#7 [internal function]: Phpcmf\Admin\Category->Phpcmf\Admin\{closure}(41, Array, Array)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(285): call_user_func_array(Object(Closure), Array)
#9 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(994): Phpcmf\Table->_Save(41, Array, Array, Object(Closure), Object(Closure))
#10 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(338): Phpcmf\Admin\Category->_Save(41, Array, Array)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(265): Phpcmf\Table->_Post(41, NULL, 1)
#12 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Category.php(24): Phpcmf\Admin\Category->_Admin_Edit()
#13 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Category->edit()
#14 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Category))
#15 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#16 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#17 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#18 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#19 {main}
ERROR - 2020-07-13 14:07:28 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SHOW COLUMNS FR...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SHOW COLUMNS FR...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SHOW COLUMNS FR...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1623): CodeIgniter\Database\BaseConnection->query('SHOW COLUMNS FR...')
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Table.php(29): CodeIgniter\Database\BaseConnection->getFieldNames('dr_1_wmtx')
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(65): Phpcmf\Model\Table->cache('1', Array)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(993): Phpcmf\Model\Cache->sync_cache()
#7 [internal function]: Phpcmf\Admin\Category->Phpcmf\Admin\{closure}(41, Array, Array)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(285): call_user_func_array(Object(Closure), Array)
#9 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(994): Phpcmf\Table->_Save(41, Array, Array, Object(Closure), Object(Closure))
#10 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(338): Phpcmf\Admin\Category->_Save(41, Array, Array)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(265): Phpcmf\Table->_Post(41, NULL, 1)
#12 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Category.php(24): Phpcmf\Admin\Category->_Admin_Edit()
#13 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Category->edit()
#14 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Category))
#15 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#16 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#17 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#18 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#19 {main}
CRITICAL - 2020-07-13 14:07:28 --> Table 'cms.dr_1_wmtx' doesn't exist
# http://10.50.0.40/admin.php?c=category&m=edit&id=41
# SHOW COLUMNS FROM `dr_1_wmtx`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SHOW COLUMNS FR...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SHOW COLUMNS FR...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SHOW COLUMNS FR...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1623): CodeIgniter\Database\BaseConnection->query('SHOW COLUMNS FR...')
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Table.php(29): CodeIgniter\Database\BaseConnection->getFieldNames('dr_1_wmtx')
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(65): Phpcmf\Model\Table->cache('1', Array)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(993): Phpcmf\Model\Cache->sync_cache()
#7 [internal function]: Phpcmf\Admin\Category->Phpcmf\Admin\{closure}(41, Array, Array)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(285): call_user_func_array(Object(Closure), Array)
#9 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(994): Phpcmf\Table->_Save(41, Array, Array, Object(Closure), Object(Closure))
#10 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(338): Phpcmf\Admin\Category->_Save(41, Array, Array)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(265): Phpcmf\Table->_Post(41, NULL, 1)
#12 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Category.php(24): Phpcmf\Admin\Category->_Admin_Edit()
#13 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Category->edit()
#14 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Category))
#15 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#16 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#17 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#18 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#19 {main}
ERROR - 2020-07-13 14:07:35 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 14:07:35 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594620454607
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 14:07:35 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 14:07:35 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594620454608
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:08:46 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:08:46 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594624125807
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:08:46 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:08:46 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594624125808
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:09:27 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:09:27 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594624167308
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:09:27 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:09:27 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594624167309
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:09:51 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:09:51 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594624191462
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:09:52 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:09:52 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594624191463
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:32:50 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 15:32:50 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 15:33:18 --> 页面http://10.50.0.40/index.php?c=category&id=53模板文件不存在：D:\phpstudy_pp\WWW\cms/template/pc/new_templates/home/404.html
ERROR - 2020-07-13 15:34:18 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:34:18 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594625658149
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:34:18 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:34:18 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594625658150
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:36:10 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 15:36:10 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 15:37:06 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:37:06 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594625826633
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:37:07 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:37:07 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594625826634
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:37:10 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 15:37:10 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 15:38:06 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:38:06 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594625886623
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:38:07 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:38:07 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594625886624
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:40:41 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(235): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 15:40:41 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache&id=update_cache
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(235): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 15:45:55 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_recycle' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SHOW COLUMNS FR...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SHOW COLUMNS FR...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SHOW COLUMNS FR...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1623): CodeIgniter\Database\BaseConnection->query('SHOW COLUMNS FR...')
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1663): CodeIgniter\Database\BaseConnection->getFieldNames('dr_1_wmtx_recyc...')
#5 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Check.php(280): CodeIgniter\Database\BaseConnection->fieldExists('result', 'dr_1_wmtx_recyc...')
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Check->do_index()
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Check))
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#9 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#10 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#11 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#12 {main}
CRITICAL - 2020-07-13 15:45:55 --> Table 'cms.dr_1_wmtx_recycle' doesn't exist
# http://10.50.0.40/admin.php?c=check&m=do_index&id=07
# SHOW COLUMNS FROM `dr_1_wmtx_recycle`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SHOW COLUMNS FR...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SHOW COLUMNS FR...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SHOW COLUMNS FR...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1623): CodeIgniter\Database\BaseConnection->query('SHOW COLUMNS FR...')
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1663): CodeIgniter\Database\BaseConnection->getFieldNames('dr_1_wmtx_recyc...')
#5 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Check.php(280): CodeIgniter\Database\BaseConnection->fieldExists('result', 'dr_1_wmtx_recyc...')
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Check->do_index()
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Check))
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#9 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#10 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#11 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#12 {main}
ERROR - 2020-07-13 15:45:55 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(190): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Check.php(557): Phpcmf\Model->counts()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Check.php(383): Phpcmf\Controllers\Admin\Check->_check_table_counts('1_wmtx', 'wmtx\xE6\xA8\xA1\xE5\x9D\x97\xE4\xB8\xBB\xE8\xA1...')
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Check->do_index()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Check))
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#10 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#11 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#12 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#13 {main}
CRITICAL - 2020-07-13 15:45:55 --> Table 'cms.dr_1_wmtx' doesn't exist
# http://10.50.0.40/admin.php?c=check&m=do_index&id=10
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(190): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Check.php(557): Phpcmf\Model->counts()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Check.php(383): Phpcmf\Controllers\Admin\Check->_check_table_counts('1_wmtx', 'wmtx\xE6\xA8\xA1\xE5\x9D\x97\xE4\xB8\xBB\xE8\xA1...')
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Check->do_index()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Check))
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#10 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#11 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#12 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#13 {main}
ERROR - 2020-07-13 15:49:29 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 15:49:29 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 15:50:16 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:50:16 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594626615885
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:50:16 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:50:16 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594626615886
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:50:47 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SHOW COLUMNS FR...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SHOW COLUMNS FR...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SHOW COLUMNS FR...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1623): CodeIgniter\Database\BaseConnection->query('SHOW COLUMNS FR...')
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Table.php(29): CodeIgniter\Database\BaseConnection->getFieldNames('dr_1_wmtx')
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(65): Phpcmf\Model\Table->cache('1', Array)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(993): Phpcmf\Model\Cache->sync_cache()
#7 [internal function]: Phpcmf\Admin\Category->Phpcmf\Admin\{closure}(71, Array, Array)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(285): call_user_func_array(Object(Closure), Array)
#9 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(994): Phpcmf\Table->_Save(71, Array, Array, Object(Closure), Object(Closure))
#10 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(338): Phpcmf\Admin\Category->_Save(0, Array, Array)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(244): Phpcmf\Table->_Post(0, Array, 1)
#12 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Category.php(20): Phpcmf\Admin\Category->_Admin_Add()
#13 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Category->add()
#14 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Category))
#15 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#16 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#17 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#18 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#19 {main}
CRITICAL - 2020-07-13 15:50:47 --> Table 'cms.dr_1_wmtx' doesn't exist
# http://10.50.0.40/admin.php?c=category&m=add
# SHOW COLUMNS FROM `dr_1_wmtx`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SHOW COLUMNS FR...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SHOW COLUMNS FR...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SHOW COLUMNS FR...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1623): CodeIgniter\Database\BaseConnection->query('SHOW COLUMNS FR...')
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Table.php(29): CodeIgniter\Database\BaseConnection->getFieldNames('dr_1_wmtx')
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(65): Phpcmf\Model\Table->cache('1', Array)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(993): Phpcmf\Model\Cache->sync_cache()
#7 [internal function]: Phpcmf\Admin\Category->Phpcmf\Admin\{closure}(71, Array, Array)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(285): call_user_func_array(Object(Closure), Array)
#9 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(994): Phpcmf\Table->_Save(71, Array, Array, Object(Closure), Object(Closure))
#10 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Table.php(338): Phpcmf\Admin\Category->_Save(0, Array, Array)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Control\Admin\Category.php(244): Phpcmf\Table->_Post(0, Array, 1)
#12 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Category.php(20): Phpcmf\Admin\Category->_Admin_Add()
#13 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Category->add()
#14 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Category))
#15 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#16 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#17 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#18 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#19 {main}
ERROR - 2020-07-13 15:51:19 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SHOW COLUMNS FR...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SHOW COLUMNS FR...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SHOW COLUMNS FR...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1623): CodeIgniter\Database\BaseConnection->query('SHOW COLUMNS FR...')
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Table.php(29): CodeIgniter\Database\BaseConnection->getFieldNames('dr_1_lxwm')
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(65): Phpcmf\Model\Table->cache('1', Array)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Module.php(111): Phpcmf\Model\Cache->sync_cache('')
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Module->uninstall()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Module))
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#10 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#11 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#12 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#13 {main}
CRITICAL - 2020-07-13 15:51:19 --> Table 'cms.dr_1_lxwm' doesn't exist
# http://10.50.0.40/admin.php?c=module&m=uninstall&dir=wmtx
# SHOW COLUMNS FROM `dr_1_lxwm`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SHOW COLUMNS FR...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SHOW COLUMNS FR...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SHOW COLUMNS FR...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(1623): CodeIgniter\Database\BaseConnection->query('SHOW COLUMNS FR...')
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Table.php(29): CodeIgniter\Database\BaseConnection->getFieldNames('dr_1_lxwm')
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(65): Phpcmf\Model\Table->cache('1', Array)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Module.php(111): Phpcmf\Model\Cache->sync_cache('')
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Module->uninstall()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Module))
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#10 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#11 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#12 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#13 {main}
ERROR - 2020-07-13 15:51:27 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:51:27 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594626687413
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:51:27 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:51:27 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594626687414
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:52:15 --> mysqli_sql_exception: Table 'cms.dr_admin_min_menu' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Menu.php(144): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Module.php(941): Phpcmf\Model\Menu->update_module('news', Array, Array, NULL)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(66): Phpcmf\Model\Module->cache('1', Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Module.php(111): Phpcmf\Model\Cache->sync_cache('')
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Module->uninstall()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Module))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 15:52:15 --> Table 'cms.dr_admin_min_menu' doesn't exist
# http://10.50.0.40/admin.php?c=module&m=uninstall&dir=lxwm
# SELECT *
FROM `dr_admin_min_menu`
WHERE `mark` = 'content-module'
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Menu.php(144): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Module.php(941): Phpcmf\Model\Menu->update_module('news', Array, Array, NULL)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(66): Phpcmf\Model\Module->cache('1', Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Module.php(111): Phpcmf\Model\Cache->sync_cache('')
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Module->uninstall()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Module))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 15:52:21 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:52:21 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594626741388
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:52:21 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 15:52:21 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594626741389
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 15:52:27 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 15:52:27 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 15:53:08 --> mysqli_sql_exception: Tablespace '`cms`.`dr_1_lxwm_draft`' exists. in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('CREATE TABLE IF...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('CREATE TABLE IF...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Module.php(283): CodeIgniter\Database\BaseConnection->simpleQuery('CREATE TABLE IF...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Module.php(87): Phpcmf\Model\Module->install('lxwm', Array)
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Module->install()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Module))
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#7 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#8 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#9 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#10 {main}
CRITICAL - 2020-07-13 15:53:08 --> Tablespace '`cms`.`dr_1_lxwm_draft`' exists.
# http://10.50.0.40/admin.php?c=module&m=install&dir=lxwm&type=0
# INSERT INTO `dr_field` (`name`, `ismain`, `setting`, `issystem`, `ismember`, `disabled`, `fieldname`, `fieldtype`, `relatedid`, `relatedname`, `displayorder`) VALUES ('内容', 0, '{\"option\":{\"mode\":1,\"width\":\"100%\",\"height\":400},\"validate\":{\"xss\":1,\"required\":1}}', 1, 1, 0, 'content', 'Ueditor', 11, 'module', 0)
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('CREATE TABLE IF...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('CREATE TABLE IF...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Module.php(283): CodeIgniter\Database\BaseConnection->simpleQuery('CREATE TABLE IF...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Module.php(87): Phpcmf\Model\Module->install('lxwm', Array)
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Module->install()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Module))
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#7 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#8 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#9 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#10 {main}
ERROR - 2020-07-13 15:53:28 --> mysqli_sql_exception: Tablespace '`cms`.`dr_1_wmtx_draft`' exists. in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('CREATE TABLE IF...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('CREATE TABLE IF...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Module.php(283): CodeIgniter\Database\BaseConnection->simpleQuery('CREATE TABLE IF...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Module.php(87): Phpcmf\Model\Module->install('wmtx', Array)
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Module->install()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Module))
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#7 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#8 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#9 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#10 {main}
CRITICAL - 2020-07-13 15:53:28 --> Tablespace '`cms`.`dr_1_wmtx_draft`' exists.
# http://10.50.0.40/admin.php?c=module&m=install&dir=wmtx&type=0
# INSERT INTO `dr_field` (`name`, `ismain`, `setting`, `issystem`, `ismember`, `disabled`, `fieldname`, `fieldtype`, `relatedid`, `relatedname`, `displayorder`) VALUES ('内容', 0, '{\"option\":{\"mode\":1,\"width\":\"100%\",\"height\":400},\"validate\":{\"xss\":1,\"required\":1}}', 1, 1, 0, 'content', 'Ueditor', 12, 'module', 0)
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('CREATE TABLE IF...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('CREATE TABLE IF...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Module.php(283): CodeIgniter\Database\BaseConnection->simpleQuery('CREATE TABLE IF...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Module.php(87): Phpcmf\Model\Module->install('wmtx', Array)
#4 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Module->install()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Module))
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#7 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#8 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#9 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#10 {main}
ERROR - 2020-07-13 15:53:36 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 15:53:36 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 15:54:15 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 15:54:15 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 15:59:57 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 15:59:57 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 16:03:34 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 16:03:34 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 16:06:54 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 16:06:54 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594627613592
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 16:06:54 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 16:06:54 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594627613593
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 16:07:11 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 16:07:11 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 16:07:25 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 16:07:25 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 16:08:42 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 16:08:42 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594627722392
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 16:08:42 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 16:08:42 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594627722393
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 16:09:27 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 16:09:27 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 16:11:11 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_category' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(190): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Check.php(391): Phpcmf\Model->counts()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Check->do_index()
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Check))
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#9 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#10 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#11 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#12 {main}
CRITICAL - 2020-07-13 16:11:11 --> Table 'cms.dr_1_wmtx_category' doesn't exist
# http://10.50.0.40/admin.php?c=check&m=do_index&id=10
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_category`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(190): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Check.php(391): Phpcmf\Model->counts()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Check->do_index()
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Check))
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#9 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#10 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#11 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#12 {main}
ERROR - 2020-07-13 16:12:08 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 16:12:09 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594627928649
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 16:12:09 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 16:12:09 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594627928650
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 16:16:01 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 16:16:01 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594628161399
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 16:16:02 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 16:16:02 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594628161400
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 16:16:05 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 16:16:05 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
ERROR - 2020-07-13 16:36:33 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 16:36:33 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594629392952
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 16:36:33 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
CRITICAL - 2020-07-13 16:36:33 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594629392953
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#10 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#11 {main}
ERROR - 2020-07-13 16:36:37 --> mysqli_sql_exception: Table 'cms.dr_admin_min_menu' doesn't exist in D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Menu.php(144): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Module.php(941): Phpcmf\Model\Menu->update_module('news', Array, Array, NULL)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(133): Phpcmf\Model\Module->cache('1', Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 16:36:37 --> Table 'cms.dr_admin_min_menu' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_min_menu`
WHERE `mark` = 'content-module'
#0 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pp\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Menu.php(144): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Module.php(941): Phpcmf\Model\Menu->update_module('news', Array, Array, NULL)
#6 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Model\Cache.php(133): Phpcmf\Model\Module->cache('1', Array)
#7 D:\phpstudy_pp\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pp\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pp\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pp\WWW\cms\index.php(47): require('D:\\phpstudy_pp\\...')
#13 D:\phpstudy_pp\WWW\cms\admin.php(9): require('D:\\phpstudy_pp\\...')
#14 {main}
CRITICAL - 2020-07-13 17:00:24 --> Unknown database 'cms'
# http://10.50.0.40/
# 
#0 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(377): CodeIgniter\Database\MySQLi\Connection->connect(false)
#1 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(643): CodeIgniter\Database\BaseConnection->initialize()
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#3 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Model\Member.php(221): CodeIgniter\Database\BaseBuilder->get()
#4 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Core\Phpcmf.php(234): Phpcmf\Model\Member->get_member(1)
#5 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(886): Phpcmf\Common->__construct()
#6 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(395): CodeIgniter\CodeIgniter->createController()
#7 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#10 {main}
CRITICAL - 2020-07-13 17:00:35 --> Unknown database 'cms'
# http://10.50.0.40/admin.php
# 
#0 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(377): CodeIgniter\Database\MySQLi\Connection->connect(false)
#1 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(643): CodeIgniter\Database\BaseConnection->initialize()
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#3 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Model\Member.php(221): CodeIgniter\Database\BaseBuilder->get()
#4 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Core\Phpcmf.php(234): Phpcmf\Model\Member->get_member(1)
#5 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(886): Phpcmf\Common->__construct()
#6 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(395): CodeIgniter\CodeIgniter->createController()
#7 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#10 D:\phpstudy_pro\WWW\cms\admin.php(9): require('D:\\phpstudy_pro...')
#11 {main}
ERROR - 2020-07-13 17:08:13 --> mysqli_sql_exception: Table 'cms.dr_admin_setting' doesn't exist in D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#13 D:\phpstudy_pro\WWW\cms\admin.php(9): require('D:\\phpstudy_pro...')
#14 {main}
CRITICAL - 2020-07-13 17:08:13 --> Table 'cms.dr_admin_setting' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=cache_update
# SELECT *
FROM `dr_admin_setting`
#0 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT *\nFROM `...')
#1 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT *\nFROM `...')
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT *\nFROM `...')
#3 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseBuilder.php(1845): CodeIgniter\Database\BaseConnection->query('SELECT *\nFROM `...', Array, false)
#4 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Core\Model.php(413): CodeIgniter\Database\BaseBuilder->get()
#5 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Model\System.php(88): Phpcmf\Model->getAll()
#6 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Model\Cache.php(94): Phpcmf\Model\System->cache()
#7 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(252): Phpcmf\Model\Cache->update_cache()
#8 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->cache_update()
#9 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#10 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#11 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#12 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#13 D:\phpstudy_pro\WWW\cms\admin.php(9): require('D:\\phpstudy_pro...')
#14 {main}
ERROR - 2020-07-13 18:20:35 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#10 D:\phpstudy_pro\WWW\cms\admin.php(9): require('D:\\phpstudy_pro...')
#11 {main}
CRITICAL - 2020-07-13 18:20:35 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594635634494
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#10 D:\phpstudy_pro\WWW\cms\admin.php(9): require('D:\\phpstudy_pro...')
#11 {main}
ERROR - 2020-07-13 18:20:35 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#10 D:\phpstudy_pro\WWW\cms\admin.php(9): require('D:\\phpstudy_pro...')
#11 {main}
CRITICAL - 2020-07-13 18:20:35 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594635634495
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#10 D:\phpstudy_pro\WWW\cms\admin.php(9): require('D:\\phpstudy_pro...')
#11 {main}
CRITICAL - 2020-07-13 20:12:16 --> syntax error, unexpected '<'
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#7 {main}
CRITICAL - 2020-07-13 20:13:44 --> syntax error, unexpected '<'
# http://10.50.0.40/
# SELECT *
FROM `dr_member_group_index`
WHERE `uid` = 1
#0 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Home.php(18): Phpcmf\View->display('index.html')
#1 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Home.php(24): Phpcmf\Controllers\Home->_index()
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Home->index()
#3 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Home))
#4 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#5 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#6 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#7 {main}
ERROR - 2020-07-13 20:36:02 --> mysqli_sql_exception: Table 'cms.dr_1_lxwm_index' doesn't exist in D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#10 D:\phpstudy_pro\WWW\cms\admin.php(9): require('D:\\phpstudy_pro...')
#11 {main}
CRITICAL - 2020-07-13 20:36:02 --> Table 'cms.dr_1_lxwm_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=lxwm&_=1594643762025
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_lxwm_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#10 D:\phpstudy_pro\WWW\cms\admin.php(9): require('D:\\phpstudy_pro...')
#11 {main}
ERROR - 2020-07-13 20:36:02 --> mysqli_sql_exception: Table 'cms.dr_1_wmtx_index' doesn't exist in D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php:331
Stack trace:
#0 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#10 D:\phpstudy_pro\WWW\cms\admin.php(9): require('D:\\phpstudy_pro...')
#11 {main}
CRITICAL - 2020-07-13 20:36:02 --> Table 'cms.dr_1_wmtx_index' doesn't exist
# http://10.50.0.40/admin.php?c=api&m=mtotal&dir=wmtx&_=1594643762026
# SELECT COUNT(*) AS `numrows`
FROM `dr_1_wmtx_index`
WHERE `status` = 9
AND DATEDIFF(from_unixtime(inputtime),now()) =0
#0 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\MySQLi\Connection.php(331): mysqli->query('SELECT COUNT(*)...')
#1 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(738): CodeIgniter\Database\MySQLi\Connection->execute('SELECT COUNT(*)...')
#2 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseConnection.php(666): CodeIgniter\Database\BaseConnection->simpleQuery('SELECT COUNT(*)...')
#3 D:\phpstudy_pro\WWW\cms\dayrui\System\Database\BaseBuilder.php(1937): CodeIgniter\Database\BaseConnection->query('SELECT COUNT(*)...', Array, false)
#4 D:\phpstudy_pro\WWW\cms\dayrui\Core\Controllers\Admin\Api.php(339): CodeIgniter\Database\BaseBuilder->countAllResults()
#5 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(914): Phpcmf\Controllers\Admin\Api->mtotal()
#6 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(400): CodeIgniter\CodeIgniter->runController(Object(Phpcmf\Controllers\Admin\Api))
#7 D:\phpstudy_pro\WWW\cms\dayrui\System\CodeIgniter.php(308): CodeIgniter\CodeIgniter->handleRequest(NULL, Object(Config\Cache), false)
#8 D:\phpstudy_pro\WWW\cms\dayrui\Fcms\Init.php(337): CodeIgniter\CodeIgniter->run()
#9 D:\phpstudy_pro\WWW\cms\index.php(47): require('D:\\phpstudy_pro...')
#10 D:\phpstudy_pro\WWW\cms\admin.php(9): require('D:\\phpstudy_pro...')
#11 {main}
