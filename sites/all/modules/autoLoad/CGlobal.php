<?php
/**
 * Created by JetBrains PhpStorm.
 * User: QuynhTM
 */
class CGlobal{
    //danh muc cua tin tuc
    const dien_anh_viet_nam = 1;
    const am_nhac_viet_nam = 2;
    const am_nhac_the_gioi = 3;
    const chan_dung = 4;
    const xa_hoi = 5;
    const van_hoa = 6;

    //danh muc cha cua tin tuc ben phai
    const thong_tin_dien_anh = 7;
    const chinh_sach_van_ban = 8;

    const thu_vien_anh = 9;

    public static $aryCatergoryNews = array(
        self::dien_anh_viet_nam => 'Điện ảnh Việt Nam',
        self::am_nhac_viet_nam => 'Âm nhạc Việt Nam',
        self::am_nhac_the_gioi => 'Âm nhạc thế giới',
        self::chan_dung => 'Chân dung',
        self::xa_hoi => 'Xã hội',
        self::van_hoa => 'Văn hóa',
    );

    public static $aryNameAliasNews = array(
        self::dien_anh_viet_nam => 'dien-anh-viet-nam',
        self::am_nhac_viet_nam => 'am-nhac-viet-nam',
        self::am_nhac_the_gioi => 'am-nhac-the-gioi',
        self::chan_dung => 'chan-dung',
        self::xa_hoi => 'xa-hoi',
        self::van_hoa => 'van-hoa',
    );

}