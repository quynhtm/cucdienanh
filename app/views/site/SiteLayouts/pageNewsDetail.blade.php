<div class="site-left col-lg-8 col-sm-8">
	<div class="main-view">
	   <div class="main-content-view">
	      <div class="link-breadcrumb">
	        <a href="{{URL::route('site.home')}}" title="{{Langs::getItemByKeywordLang('text_home', $lang)}}">{{Langs::getItemByKeywordLang('text_home', $lang)}}</a>
	        @if(sizeof($arrCat) > 0)
	         › 
	        <a href="{{FunctionLib::buildLinkCategory($arrCat->category_id, $arrCat->category_name)}}" title="{{$arrCat->category_name}}">{{$arrCat->category_name}}</a>
	       @endif
	      </div>
	      @if(sizeof($item) > 0)
		      <h1 class="title-news">{{$item['news_title']}}</h1>
		      <div class="date"><i class="icon-other icon-date"></i>{{date('h:i', $item['news_create'])}} {{Langs::getItemByKeywordLang('text_date', $lang)}} {{date('d/m/Y', $item['news_create'])}}</div>
		      <div class="line-content-view view-one-cat">
		         @if($item['news_intro'] != '')
		         <b>{{stripslashes($item['news_intro'])}}</b><br><br>
		         @endif
		         {{stripslashes($item['news_content'])}}
		      </div>
	      @endif
	   </div>
	</div>
</div>