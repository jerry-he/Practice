/**
 * Created by JerryHe on 12/21/15.
 */
window.onload = function(){
    var lis = document.getElementsByClassName('dot')[0];
    lis = lis.children;
    var pics = document.getElementsByClassName('container')[0];
    pics = pics.children;
    /*nav焦点颜色切换*/
    function ToggleDot(el){
       var des = el.parentNode.parentNode;
       var des = des.getElementsByTagName('span');
        for(var j = 0 ;j< lis.length; j++){
            des[j].style.color = "#eee";
            des[j].id = j;
        }

        el.style.color = "green";
    }
    /*焦点图片切换*/
    function TogglePicture(el){
        var  index = el.getAttribute("id");
        for(var m = 0 ; m<pics.length;m++){
            pics[m].style.display = "none";
        }
        pics[index].style.display= 'block';
    }
    /*event proxy*/
    for(var i = 0;i<lis.length;i++){
     lis[i].onclick = function(e){
         e = e || window.event;
         var el = e.target;
         switch (el.className){
             case 'dotFigure':
                 ToggleDot(el);
                 TogglePicture(el);
             break;
         }
     }
    }
}