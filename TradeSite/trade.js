/**
 * Created by JerryHe on 12/28/15.
 */
    /*focus picture*/
    var FocusPicture = function(pics,lis,timer){
        var index=0;
        setInterval(function(){
            for(var m = 0 ; m<pics.length;m++){
                pics[m].style.display = "none";
            }
            for(var m = 0 ; m<lis.length;m++){
                lis[m].firstChild.style.background = "#eee";
            }
            pics[index].style.display= 'block';
            lis[index].firstChild.style.background='green';
            if(index < pics.length-1){
                index++;
            }
            else{
                index = 0;
            }

        },timer);


        /*nav焦点颜色切换*/
        function ToggleDot(el){
            var des = el.parentNode.parentNode;
            var des = des.getElementsByTagName('span');
            for(var j = 0 ;j< lis.length; j++){
                des[j].style.background = "#eee";
                des[j].id = j;
            }

            el.style.background = "green";
        }
        /*焦点图片切换*/
        function TogglePicture(el){
            index = el.getAttribute("id");
            for(var m = 0 ; m<pics.length;m++){
                pics[m].style.display = "none";

            }
            pics[index].style.display= 'block';
        }
        /*event proxy*/
        for(var i = 0;i<lis.length;i++){
            lis[i].onclick = function(e){
                e = e || window.event;
                var el = e.srcElement||e.target;
                switch (el.className){
                    case 'dotFigure':
                        ToggleDot(el);
                        TogglePicture(el);
                        break;
                }
            }
        }
    };

