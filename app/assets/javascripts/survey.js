$( document ).ready(function() {

		//Inputs that determine what fields to show
		var rating_1 = $('#rating_form input:radio[id=rating-input-1-1]');		
		var rating_2 = $('#rating_form input:radio[id=rating-input-1-2]');
		var rating_3 = $('#rating_form input:radio[id=rating-input-1-3]');
		var rating_4 = $('#rating_form input:radio[id=rating-input-1-4]');
		var rating_5 = $('#rating_form input:radio[id=rating-input-1-5]');
		var rating = rating_1.add(rating_2).add(rating_3).add(rating_4).add(rating_5)
		//Wrappers for all fields
		var comment_area = $('#rating_form textarea[name="comment_name"]').parent();
		var save_conv_area = $('#rating_form input:checkbox[name="save_conversation"]').parent();
		var all=comment_area.add(save_conv_area);
		rating.change(function(){
			// var value=this.value;						
			all.addClass('hidden'); //hide everything and reveal as needed
			if (window.console) console.log('checked');
			if (rating_1.is(':checked') || rating_2.is(':checked')){
				all.removeClass('hidden');								
			}
			else if (rating_3.is(':checked') || rating_4.is(':checked') || rating_5.is(':checked')){
				comment_area.removeClass('hidden');
			}
		});	
});