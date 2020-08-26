// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//
// require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
(function ($) {

    $(window).on("load orientationchange resize", function() {
        var title_width = $('.folder-title').width();
        var title_width_all = $('.folder-top').width();
        var title_width_diff = title_width_all - title_width;

        if( title_width_all > title_width) {
            $('.folder-top--over').css('width', title_width_diff + 'px');
        }
    });

    $(function($){
        $('.tab').click(function(){
            $('.is-active').removeClass('is-active');
            $(this).addClass('is-active');
            $('.is-show').removeClass('is-show');
            const index = $(this).index();
            $('.folder-content__wrap').eq(index).addClass('is-show');
        });
    });
    
    $(function($){
        $('.cat-create-btn').click(function() {
            $('.cat-create-modal').css('display', 'block');
        });
        
        $('.close-btn').click(function() {
            $('.cat-create-modal').css('display', 'none');
        });
    });
    
    $(function($){
        $('.cat-delete-btn').click(function() {
            $('.cat-delete-modal').css('display', 'block');
        });
        
        $('.close-btn').click(function() {
            $('.cat-delete-modal').css('display', 'none');
        });
    });
    
    
    $(function($){
        $('.add-idea__btn').click(function() {
            $('.add-idea__form').css('display', 'block');
        });
        
        $('.close-btn').click(function() {
            $('.add-idea__form').css('display', 'none');
        });
    });
    
    // コメントモーダル
    $(function($){
        $('.item.comment-btn').click(function() {
            var index = $('.item.comment-btn').index(this);
    		$('.comment-modal').css('display','none');
    		$('.comment-modal').eq(index).css('display','block');
    		$('.item.comment-btn').removeClass('active');
    		$(this).addClass('active');
        });
        
        $('.close-btn').click(function() {
            $('.comment-modal').css('display', 'none');
        });
    });
    
    $(function($){
        $('.comment-update-btn').click(function() {
            var index = $('.comment-update-btn').index(this);
            $('.current-user-comment-wrap').eq(index).css('display', 'none');
            $('.current-user-comment-update-wrap').eq(index).css('display', 'block');
        });
        
        $('.comment-update-close-btn').click(function() {
            var index = $('.comment-update-close-btn').index(this);
            $('.current-user-comment-update-wrap').eq(index).css('display', 'none');
            $('.current-user-comment-wrap').eq(index).css('display', 'block');
        });
    });
    
    // 編集モーダル出しわけ
    $(function($){
    	$('.item.modify-btn').click(function() {
    		var index = $('.item.modify-btn').index(this);
    		$('.folder-item__modify-modal').css('display','none');
    		$('.folder-item__modify-modal').eq(index).css('display','block');
    		$('.item.modify-btn').removeClass('active');
    		$(this).addClass('active');
    	});
    	
    	$('.close-btn').click(function() {
            $('.folder-item__modify-modal').css('display', 'none');
        });
    });
    
    
    $(window).on('load',function(){
        $('#category:first-child').addClass('is-active');
        $('.folder-content__wrap:first-child').addClass('is-show');
    });
    
})(jQuery);





