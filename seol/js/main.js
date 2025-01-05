function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
$(function(){
	$('a[target="_blank"]').attr('rel', 'noreferrer');
	$('.tab_group .tab_menu li a').on('click', function(event){
		var $this = $(this),
			Datakey = $this.attr('data-key'),
			$Myparent = $this.parent('li'),
			ParentIndex = $Myparent.index(),
			IsActive = $Myparent.hasClass('active'),
			$Otherparents = $Myparent.siblings('li'),
			$OtherLinks = $Otherparents.find('a');

		Datakey = Datakey.replace(",","");
		if(IsActive==false){
			$.ajax({
				url : '/seol/repository/contents/'+Datakey+'.html',
				success : function (data) {
					$('#contents').empty().attr('class', 'cts'+Datakey).append(data);
					$('#contents').find('table.responsive').not($('.prettyprint').children()).each(function() {
						var RowSpanExist = $(this).find('td, th').is('[rowspan]'),
							TheadExist = $(this).find('thead').length;
						if((RowSpanExist==false) && (TheadExist!=0)){//rowspan이 없을 경우만 실행 (rowspan이 있으면 지원불가)
							$(this).children('tbody').children('tr').find('th, td').each(function() {
								var ThisIndex = $(this).index(),
									TheadText = $(this).parents('tbody').siblings('thead').find('th').eq(ThisIndex).text();
								$(this).attr('data-content', TheadText);
							});
							$(this).children('tfoot').children('tr').find('th, td').each(function() {
								var ThisIndex = $(this).index(),
									TheadText = $(this).parents('tfoot').siblings('thead').find('th').eq(ThisIndex).text();
								$(this).attr('data-content', TheadText);
							});
						};
					});
					$('#contents').find('a[target="_blank"]').attr('rel', 'noreferrer');
					$Otherparents.removeClass('active');
					$OtherLinks.removeAttr('title');
					$Myparent.addClass('active');
					$this.attr('title', '선택됨');
				//	$.cookie('active', ParentIndex);
					//history.pushState(null, null, '?key='+ParentIndex);
					history.pushState(null, null, '?key='+Datakey);
				},
				error:function(request, status, error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		} else{
			
		}
		
		
		event.preventDefault();
	});
	$(window).on('load', function(event) {
		var cookieActive = $.cookie('active');
		var menukey = getParameterByName('key');
		var menukeyresult1 = menukey.substr(0, 1),
			menukeyresult2 = menukey.substr(1, 3),
			menukeyresult = menukeyresult1+','+menukeyresult2;
		if(menukey){
			$('.tab_group .tab_menu li').find('a[data-key="'+menukeyresult+'"]').attr('title', '선택됨').parent('li').addClass('active');
		} else{
			$('.tab_group .tab_menu li:first-child a').click();
		}
	});
});
