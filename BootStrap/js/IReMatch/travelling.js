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
    /*鼠标跟随显示大图*/
    $(".preview").preview();

    /*fixed tour navigation*/
    $(document).ready(function(){
        $(window).scroll(function(){
            var topHeight = document.body.scrollTop;
            var des = document.getElementById('info-nav');

            if(topHeight > 1080){
                $(des).css("position", "fixed");
                $(des).css("top",'0');
                $(des).css("z-index",'10');
                $(des).addClass('container')
            }
            else{
                $(des).css("position", "relative");
                $(des).css("top",'0');
            }
        })
    });
    /*print object attr*/

var JSON = {
    "url": "www.baidu.com",
    "data": [
        {
            "name": "luoyang",
            "sort": "1",
            "img":"../../1.jpg",
            "x_y":[116.368904, 39.913423]
        },
        {
            "name": "zhengzhou",
            "sort": "2",
            "img":"../../2.jpg",
            "x_y":[113.625069,34.749794]
        },
    ]
}
