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
    	
    	$arrMeta = Info::getItemByTypeInfoAndTypeLanguage(CGlobal::INFOR_SEO, $this->lang);
    	
    	if(!empty($arrMeta)){
    		$meta_title = $arrMeta->meta_title;
    		$meta_keywords = $arrMeta->meta_keywords;
    		$meta_description = $arrMeta->meta_description;
    	}
    	FunctionLib::SEO($meta_img, $meta_title, $meta_keywords, $meta_description);
		
		$this->header();
        $this->layout->content = View::make('site.SiteLayouts.Home');
        $this->right();
        $this->footer();
    }
   
    public function pageCategory($catname='', $caid=0){
    	$arrCat = array(
		    		'category_id'=>0,
		    		'category_name'=>'',
		    	);
    	$arrItem = array();
    	$meta_title = $meta_keywords = $meta_description = 'Tin tức';
    	$meta_img = '';
    	if($caid > 0){
    		//GetCat
    		$arrCat = Category::getByID($caid);
    		if(sizeof($arrCat) > 0){
    			$meta_title = stripslashes($arrCat->category_name);
    			$meta_keywords = stripslashes($arrCat->category_meta_keywords);
    			$meta_description = stripslashes($arrCat->category_meta_description);
    		}
    		
    		$pageNo = (int) Request::get('page_no',1);
    		$limit = CGlobal::number_show_15;
    		$offset = ($pageNo - 1) * $limit;
    		$search = $data = array();
    		$total = 0;
    		
    		$search['news_category'] = (int)$caid;
    		$search['type_language'] = $this->lang;
    		$search['news_status'] = CGlobal::status_show;
    		$search['field_get'] = '';
    		
    		$arrItem = News::searchByCondition($search, $limit, $offset,$total);
    		
    		$paging = $total > 0 ? Pagging::getNewPager(3, $pageNo, $total, $limit, $search) : '';
    	}
    	
    	FunctionLib::SEO($meta_img, $meta_title, $meta_keywords, $meta_description);
    	
    	$this->header();
    	$this->layout->content = View::make('site.SiteLayouts.pageNews')
    							->with('arrItem', $arrItem)
    							->with('arrCat', $arrCat)
    							->with('paging', $paging)
    							->with('lang', $this->lang);
    	$this->right();
    	$this->footer();
    }
	public function pageContact(){
		$str = Langs::getItemByKeywordLang('text_meta_contact', $this->lang);
		$meta_title = $meta_keywords = $meta_description = $str;
		$meta_img= '';
		FunctionLib::SEO($meta_img, $meta_title, $meta_keywords, $meta_description);
		
		$arrInfoContact = Info::getItemByTypeInfoAndTypeLanguage(CGlobal::INFOR_CONTACT, $this->lang);
		$infoContact='';
		if(!empty($arrInfoContact)){
			$infoContact = stripslashes($arrInfoContact->info_content);
		}
		
		$this->header();
		$this->layout->content = View::make('site.SiteLayouts.pageContact')
								->with('infoContact', $infoContact)
								->with('lang', $this->lang);
		$this->footer();
	}
}
