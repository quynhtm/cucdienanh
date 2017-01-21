<?php
class BaseAdminController extends BaseController
{
    protected $layout = 'admin.AdminLayouts.index';
    protected $permission = array();
    protected $user = array();
    protected $is_root = false;
    protected $is_admin = false;

    public function __construct()
    {
        if (!User::isLogin()) {
            Redirect::route('admin.login',array('url'=>self::buildUrlEncode(URL::current())))->send();
        }

        $this->user = User::user_login();
        if($this->user && sizeof($this->user['user_permission']) > 0){
            $this->permission = $this->user['user_permission'];
        }
        if(in_array('root',$this->permission)){
            $this->is_root = true;
        }
        if(in_array('supper_admin',$this->permission)){
            $this->is_admin = true;
        }
        $menu = $this->menu();
        View::share('menu',$menu);
        View::share('aryPermission',$this->permission);
        View::share('user',$this->user);
        View::share('is_root',$this->is_root);
        View::share('is_admin',$this->is_admin);
    }

    public function menu(){
        $menu[] = array(
            'name'=>'QL user Admin',
            'link'=>'javascript:void(0)',
            'icon'=>'fa fa-user',
            'arr_link_sub'=>array('admin.user_view','admin.permission_view','admin.groupUser_view',),//dung de check menu left action
            'sub'=>array(
                array('name'=>'User Admin', 'RouteName'=>'admin.user_view', 'icon'=>'fa fa-user icon-4x', 'showcontent'=>1, 'permission'=>'user_view'),
                array('name'=>'Danh sách quyền', 'RouteName'=>'admin.permission_view', 'icon'=>'fa fa-user icon-4x', 'showcontent'=>0, 'permission'=>'permission_full'),
                array('name'=>'Danh sách nhóm quyền', 'RouteName'=>'admin.groupUser_view', 'icon'=>'fa fa-user icon-4x', 'showcontent'=>0, 'permission'=>'group_user_view'),
            ),
        );

        $menu[] = array(
            'name'=>'Manage System',
            'link'=>'javascript:void(0)',
            'icon'=>'fa fa-cogs',
            'arr_link_sub'=>array('admin.info','admin.contract'),
            'sub'=>array(
                //array('name'=>'Contract', 'RouteName'=>'admin.contract', 'icon'=>'fa fa-envelope-o icon-4x', 'showcontent'=>1, 'permission'=>'contract_view'),
                array('name'=>'Infor site', 'RouteName'=>'admin.info', 'icon'=>'fa fa-cogs icon-4x', 'showcontent'=>1, 'permission'=>'infor_full'),
            	array('name'=>'Language static', 'RouteName'=>'admin.lang', 'icon'=>'fa fa-cogs icon-4x', 'showcontent'=>1, 'permission'=>'infor_full'),
            ),
        );

        $menu[] = array(
            'name'=>'Manage Category',
            'link'=>'javascript:void(0)',
            'icon'=>'fa fa-gift',
            'arr_link_sub'=>array('admin.category_list',),
            'sub'=>array(
                array('name'=>'Category New', 'RouteName'=>'admin.category_list', 'icon'=>'fa fa-indent icon-4x', 'showcontent'=>1, 'permission'=>'category_full'),
            ),
        );

        $menu[] = array(
            'name'=>'Manage Content',
            'link'=>'javascript:void(0)',
            'icon'=>'fa fa-book',
            'arr_link_sub'=>array('admin.newsView','admin.bannerView','admin.videoView','admin.libraryImageView',),
            'sub'=>array(
                array('name'=>'News', 'RouteName'=>'admin.newsView', 'icon'=>'fa fa-book icon-4x', 'showcontent'=>1, 'permission'=>'news_full'),
                array('name'=>'Banner', 'RouteName'=>'admin.bannerView', 'icon'=>'fa fa-globe icon-4x', 'showcontent'=>1, 'permission'=>'banner_full'),
                array('name'=>'Video', 'RouteName'=>'admin.videoView', 'icon'=>'fa fa-video-camera icon-4x', 'showcontent'=>1, 'permission'=>'video_full'),
                array('name'=>'Library Image', 'RouteName'=>'admin.libraryImageView', 'icon'=>'fa fa-picture-o icon-4x', 'showcontent'=>1, 'permission'=>'libraryImage_full'),
            ),
        );
        return $menu;
    }

    public function getControllerAction(){
        return $routerName = Route::currentRouteName();
    }
}