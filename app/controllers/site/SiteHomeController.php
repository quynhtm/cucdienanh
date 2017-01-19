<?php
/*
* @Created by: DUYNX
* @Author    : nguyenduypt86@gmail.com
* @Date      : 11/2016
* @Version   : 1.0
*/

class SiteHomeController extends BaseSiteController{
    public function __construct(){
        parent::__construct();
    }

    public function index(){

    	//Meta title
    	$meta_title='';
    	$meta_keywords='';
    	$meta_description='';
    	$meta_img='';
    	$arrMeta = Info::getItemByKeyword('SITE_SEO_HOME');
    	if(!empty($arrMeta)){
    		$meta_title = $arrMeta->meta_title;
    		$meta_keywords = $arrMeta->meta_keywords;
    		$meta_description = $arrMeta->meta_description;
    	}
    	FunctionLib::SEO($meta_img, $meta_title, $meta_keywords, $meta_description);
		
		$this->header();
        $this->layout->content = View::make('site.SiteLayouts.Home');
        $this->footer();
    }
}
