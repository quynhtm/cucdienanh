<?php
/**
 * QuynhTM add
 */
require_once(DRUPAL_ROOT ."/phpfastcache-final/phpfastcache.php");
class Cache {
    const CACHE_ON = 1 ;// 0: khong dung qua cache, 1: dung qua cache
    const CACHE_TIME_TO_LIVE_15 = 900; //Time cache 15 phut
    const CACHE_TIME_TO_LIVE_30 = 1800; //Time cache 30 phut
    const CACHE_TIME_TO_LIVE_60 = 3600; //Time cache 60 phut
    const CACHE_TIME_TO_LIVE_ONE_DAY = 86400; //Time cache 1 ngay
    const CACHE_TIME_TO_LIVE_ONE_WEEK = 604800; //Time cache 1 tuan
    const CACHE_TIME_TO_LIVE_ONE_MONTH = 2419200; //Time cache 1 thang
    const CACHE_TIME_TO_LIVE_ONE_YEAR =  29030400; //Time cache 1 nam

    const VERSION_CACHE = 'ver_1_';//dung de thay doi cache tat ca,khong phai remove tung cache

    //cache Category
    const CACHE_TYPE_ID = 'cache_type_id_';
    const CACHE_CATEGORY_ID = 'cache_category_id_';
    const CACHE_LIST_CATEGORY_PARENT = 'cache_list_category_parent';
    const CACHE_LIST_CATEGORY_NEWS = 'cache_list_category_news';

    //cache Document
    const CACHE_DOCUMENT_ID = 'cache_document_id_';

    //cache type chuyen m?c
    const CACHE_LIST_TYPE_CATEGORY = 'cache_list_type_category';

    //cache banner
    const CACHE_BANNER_ADVANCED = 'cache_banner_advanced_';

    //cacheNew
    const CACHE_NEWS_CATEGORY = 'cache_news_category_';
    const CACHE_NEWS_ID = 'cache_news_id_';

    //cache video
    const CACHE_VIDEO_ID = 'cache_video_id_';

    public function do_put( $key, $value, $time = 0 ){
        //if $time = 0: mac dinh la 5nam (^_^)
        $cache = phpFastCache();
        return $cache->set($key,$value,$time);
    }
    public function do_get( $key ){
        $cache = phpFastCache();
        return $cache->get($key);
    }
    public function do_remove( $key ){
        $cache = phpFastCache();
        return $cache->delete($key);
    }

    //static function Cache(){}
    static function connect(){ }
    static function disconnect(){}
    static function stats(){}
    static function clear(){}
    static function encode($data){}
    static function decode($data){}

}