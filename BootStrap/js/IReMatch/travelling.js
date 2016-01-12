/**
 * Created by 晖 on 1/12/2016.
 */
    /*自动完成，提供地址信息到这个下拉列表*/
    $.get('example_collection.json', function(data){
            $("#name").typeahead({ source:data });
        },'json');
    /*hotel select*/
    $('.hotel_select').click(function(){
        $('#roomType').removeClass('hidden')
    });
    $('.hotel_select_not').click(function(){
        $('#roomType').addClass('hidden')
    });
