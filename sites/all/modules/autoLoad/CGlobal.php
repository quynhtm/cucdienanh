<?php
/**
 * Created by JetBrains PhpStorm.
 * User: QuynhTM
 */
class CGlobal{
    //danh muc cua tin tuc
    const document_dowload = 1;
    const thu_vien_anh = 2;

    //Kiểu đối tượng: 1 tin tức, 2 video:3 ảnh,4: dowload file
    const commnent_tintuc = 1;
    const commnent_video = 2;
    const commnent_anh = 3;
    const commnent_document = 4;

    public static $arrCommentType = array(
        self::commnent_tintuc => 'Tin tức',
        self::commnent_video => 'Video',
        self::commnent_anh => 'Thư viện ảnh',
        self::commnent_document => 'Dowload file',
    );

}