<?php
/*
* @Created by: DUYNX
* @Author    : nguyenduypt86@gmail.com
* @Date      : 11/2016
* @Version   : 1.0
*/

//Home
Route::any('/', array('as' => 'site.home','uses' => 'SiteHomeController@index'));
Route::get('404.html',array('as' => 'site.page404','uses' =>'SiteHomeController@page404'));
Route::get('tim-kiem.html',array('as' => 'site.searchItems','uses' =>'SiteHomeController@searchItems'));
Route::match(['GET','POST'],'lien-he.html',array('as' => 'site.pageContact','uses' =>'SiteHomeController@pageContact'));

//list tin theo danh muc Category
Route::get('{name}-{id}.html',array('as' => 'Site.pageCategory','uses' =>'SiteHomeController@pageCategory'))->where('name', '[A-Z0-9a-z_\-]+')->where('id', '[0-9]+');

//tin tuc
Route::get('tin-tuc.html',array('as' => 'Site.pageNews','uses' =>'SiteHomeController@pageNews'));
Route::get('chi-tiet/tin-tuc-{new_id}/{news_title}.html',array('as' => 'Site.pageDetailNew','uses' =>'SiteHomeController@pageDetailNew'))->where('new_id', '[0-9]+')->where('news_title', '[A-Z0-9a-z_\-]+');
Route::match(['GET','POST'], 'captcha', array('as' => 'Site.linkCaptcha','uses' =>'SiteHomeController@linkCaptcha'));
Route::match(['GET','POST'], 'captchaCheckAjax', array('as' => 'Site.captchaCheckAjax','uses' =>'SiteHomeController@captchaCheckAjax'));



